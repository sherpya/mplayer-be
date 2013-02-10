#!/bin/sh
PACKAGE=live555
VERSION=latest
EXT=tar.gz
BASEURL=http://www.live555.com/liveMedia/public/

. $(dirname $0)/../functions.sh

BUILDDIR=live
LIVEDIST=${PREFIX}/live

pkg_unpack
apply_patches

rm -fr ${LIVEDIST}/*

( cd ${BUILDDIR} &&                 \
    ./genMakefiles mingw &&         \
    LD=${CROSS_PREFIX}ld            \
    CC=${CROSS_PREFIX}gcc           \
    CXX=${CROSS_PREFIX}g++          \
    COMPILE_OPTS=${GLOBAL_CFLAGS}   \
    make ${MAKEOPTS} &&             \
    find -regex ".*\.\(a\|h\|hh\)" | cpio -pdvm ${LIVEDIST} )

pkg_clean
