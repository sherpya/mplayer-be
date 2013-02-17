#!/bin/sh
PACKAGE=live555
VERSION=latest
EXT=tar.gz
BASEURL=http://www.live555.com/liveMedia/public/

. $(dirname $0)/../functions.sh

BUILDDIR=live
LIVEDIST=${PREFIX}/live

pkg_configure()
{
    ./genMakefiles mingw
}

pkg_make_target()
{
    LD=${CROSS_PREFIX}ld            \
    CC=${CROSS_PREFIX}gcc           \
    CXX=${CROSS_PREFIX}g++          \
    COMPILE_OPTS=${GLOBAL_CFLAGS}   \
    make ${MAKEOPTS} || return 1

    rm -fr ${LIVEDIST}/*
    find -regex ".*\.\(a\|h\|hh\)" | cpio -pdvm ${LIVEDIST}
}

if [ ! -d ${LIVEDIST} ]; then
    echo "${LIVEDIST} is not a directory"
    exit 1
fi

if [ ! -w ${LIVEDIST} ]; then
    echo "${LIVEDIST} is not a writable"
    exit 1
fi

pkg_build && pkg_clean
