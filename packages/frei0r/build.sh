#!/bin/bash
# Build script for frei0r plugins
# Copyright (c) 2013-2017 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO=https://github.com/dyne/frei0r.git
MARCH=i686

. $(dirname $0)/../functions.sh

depends lib/libgavl.a

CMAKE=1
CMAKEOPTS="-DCMAKE_MODULE_LINKER_FLAGS=-s"

BUILDDIR="frei0r"

export_toolchain

get_package_filename()
{
    version=$(cd ${BUILDDIR} && git describe --tags)
    echo "$(cd dist && pwd)/frei0r-plugins-${ARCH}-${version}.7z"
}

make_binary_dist()
{
    # LIBDIR becames the binary package
    LIBDIR="${PREFIX}/lib/frei0r-1"

    for sharedlib in libstdc++-6.dll libgcc_s_dw2-1.dll libgcc_s_sjlj-1.dll libgcc_s_seh-1.dll; do
        dll=$(print_file_name $sharedlib)
        test -e ${dll} || continue
        install -v -m644 ${dll} "${LIBDIR}/${sharedlib}"
        ${CROSS_PREFIX}strip "${LIBDIR}/${sharedlib}"
    done

    for doc in AUTHORS ChangeLog COPYING README.md; do
        unix2dos -n "${BUILDDIR}/$doc" "${LIBDIR}/$doc.txt"
    done

    PACKAGE="$(get_package_filename)"
    rm -f "${PACKAGE}"
    ( cd "${PREFIX}/lib" && ${SEVENZIP} a -mx=9 "${PACKAGE}" frei0r-1 )
}

git_clean && pkg_build && make_binary_dist && git_clean
