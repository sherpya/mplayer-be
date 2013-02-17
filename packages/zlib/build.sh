#!/bin/sh
PACKAGE=zlib
VERSION=1.2.7
EXT=tar.bz2
BASEURL=http://zlib.net

. $(dirname $0)/../functions.sh

pkg_configure()
{
    AR=${CROSS_PREFIX}ar            \
    RANLIB=${CROSS_PREFIX}ranlib    \
    CC=${CROSS_PREFIX}gcc           \
    CFLAGS=${GLOBAL_CFLAGS}         \
    ./configure --static || return 1
}

pkg_make_target()
{
    make ${MAKEOPTS} libz.a || return 1

    install -m644 libz.a ${PREFIX}/lib/libz.a
    install -m644 zlib.h ${PREFIX}/include/zlib.h
    install -m644 zconf.h ${PREFIX}/include/zconf.h
}

pkg_build && pkg_clean
