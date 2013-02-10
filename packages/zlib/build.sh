#!/bin/sh
PACKAGE=zlib
VERSION=1.2.7
EXT=tar.bz2
BASEURL=http://zlib.net

. $(dirname $0)/../functions.sh

pkg_unpack

( cd ${BUILDDIR} &&                 \
    AR=${CROSS_PREFIX}ar            \
    RANLIB=${CROSS_PREFIX}ranlib    \
    CC=${CROSS_PREFIX}gcc           \
    CFLAGS=${GLOBAL_CFLAGS}         \
    ./configure --static &&         \
    make ${MAKEOPTS} )

install -m644 ${BUILDDIR}/libz.a ${PREFIX}/lib/libz.a
install -m644 ${BUILDDIR}/zlib.h ${PREFIX}/include/zlib.h
install -m644 ${BUILDDIR}/zconf.h ${PREFIX}/include/zconf.h

pkg_clean
