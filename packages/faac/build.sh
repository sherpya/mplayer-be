#!/bin/bash
# Build script for FAAC MPEG-4 AAC Encoder
# Copyright (c) 2013-2016 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=faac
VERSION=1.28
EXT=tar.bz2
BASEURL=http://downloads.sourceforge.net/project/faac/faac-src/faac-1.28
MARCH=i686

. $(dirname $0)/../functions.sh

CONFOPTS="--with-mp4v2=no"
PACKAGE="../dist/libfaac-${ARCH}-${VERSION}.7z"

export_toolchain

save_function pkg_configure do_pkg_configure
pkg_configure()
{
    mkdir -p ../dist
    test -e ${PACKAGE} && return 0
    do_pkg_configure $*
}

make_binary_dist()
{
    test -e ${PACKAGE} && return 0

    echo "Building binary package..."
    make ${MAKEOPTS} -C libfaac || return 1
    ${CC} -shared libfaac/libfaac.def -o libfaac.dll libfaac/.libs/libfaac.a

    rm -fr ../dist/${ARCH}
    install -d ../dist/${ARCH}
    
    ${STRIP} libfaac.dll
    install -m 644 libfaac.dll ../dist/${ARCH}
    unix2dos -n COPYING ../dist/${ARCH}/COPYING.txt
    unix2dos -n README ../dist/${ARCH}/README.txt

    ( cd ../dist && 7z a -mx=9 ${PACKAGE} ${ARCH} && rm -fr ${ARCH} )
}

pkg_make_target()
{
    make_binary_dist || return 1

    echo "Installing headers"
    install -m644 include/faac.h ${PREFIX}/include/faac.h
    install -m644 include/faaccfg.h ${PREFIX}/include/faaccfg.h
}

pkg_build && pkg_clean
