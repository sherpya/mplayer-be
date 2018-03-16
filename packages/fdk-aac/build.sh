#!/bin/bash
# Build script for The Fraunhofer FDK AAC Codec Library for Android
# Copyright (c) 2014 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO=https://github.com/mstorsjo/fdk-aac.git
MARCH=i686

. $(dirname $0)/../functions.sh

BUILDDIR="fdk-aac"

HEADERS="
    libAACdec/include/aacdecoder_lib.h \
    libAACenc/include/aacenc_lib.h \
    libSYS/include/FDK_audio.h \
    libSYS/include/genericStds.h \
    libSYS/include/machine_type.h"

export_toolchain

get_package_filename()
{
    echo "../dist/libfdk-aac-${ARCH}-$(git describe --tags).7z"
}

pkg_configure()
{
    test -e "$(get_package_filename)" && return 0

    mkdir -p ../dist
    test -x configure || autoreconf -fi

    . ${topdir}/ac_cache.sh

    CC="${HOST}-gcc -static-libgcc" \
    ./configure             \
        --host=${HOST}      \
        --prefix=${PREFIX}  \
        --enable-shared     \
        --disable-static  || return 1
}

make_binary_dist()
{
    PACKAGE="$(get_package_filename)"
    test -e ${PACKAGE} && return 0
    
    echo "Building binary package..."
    make ${MAKEOPTS} || return 1

    rm -fr ../dist/${ARCH}
    install -d ../dist/${ARCH}
    ${STRIP} .libs/libfdk-aac-1.dll
    install -m644 .libs/libfdk-aac-1.dll ../dist/${ARCH}
    unix2dos -n NOTICE ../dist/${ARCH}/NOTICE.txt

    ( cd ../dist && 7z a -mx=9 ${PACKAGE} ${ARCH} && rm -fr ${ARCH} )
}

pkg_make_target()
{
    make_binary_dist || return 1

    echo "Installing headers"
    install -d -m755 ${PREFIX}/include/fdk-aac
    for header in $HEADERS; do
        cmd install -m644 $header ${PREFIX}/include/fdk-aac
    done
}

git_clean && pkg_build && git_clean
