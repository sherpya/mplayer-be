#!/bin/sh
PACKAGE=xvidcore
VERSION=1.3.2
EXT=tar.bz2
BASEURL=http://downloads.xvid.org/downloads

. $(dirname $0)/../functions.sh

BUILDDIR=xvidcore/build/generic

pkg_unpack
apply_patches
CC=${CROSS_PREFIX}gcc pkg_configure || exit 1
pkg_make || exit 1

install -m644 ${BUILDDIR}/=build/xvidcore.a ${PREFIX}/lib/libxvidcore.a
install -m644 ${BUILDDIR}/../../src/xvid.h ${PREFIX}/include/xvid.h

BUILDDIR=xvidcore pkg_clean
