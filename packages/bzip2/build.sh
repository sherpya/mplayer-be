#!/bin/bash
PACKAGE=bzip2
VERSION=1.0.6
EXT=tar.gz
BASEURL=http://www.bzip.org/${VERSION}

. $(dirname $0)/../functions.sh

pkg_make_target()
{
    AR=${CROSS_PREFIX}ar            \
    RANLIB=${CROSS_PREFIX}ranlib    \
    CC=${CROSS_PREFIX}gcc           \
    CFLAGS=${GLOBAL_CFLAGS}         \
    make ${MAKEOPTS} libbz2.a || return 1

    install -m644 libbz2.a ${PREFIX}/lib/libbz2.a
    install -m644 bzlib.h ${PREFIX}/include/bzlib.h
}

pkg_build && pkg_clean
