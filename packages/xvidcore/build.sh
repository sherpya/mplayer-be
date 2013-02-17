#!/bin/sh
PACKAGE=xvidcore
VERSION=1.3.2
EXT=tar.bz2
BASEURL=http://downloads.xvid.org/downloads

. $(dirname $0)/../functions.sh

BUILDDIR=xvidcore/build/generic
CC=${CROSS_PREFIX}gcc

pkg_make_target()
{
    make ${MAKEOPTS}
    install -m644 =build/xvidcore.a ${PREFIX}/lib/libxvidcore.a
    install -m644 ../../src/xvid.h ${PREFIX}/include/xvid.h
}

pkg_build && BUILDDIR=xvidcore pkg_clean
