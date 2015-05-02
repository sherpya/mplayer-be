#!/bin/bash
# Build script for live555.com streaming media library
# Copyright (c) 2013-2015 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=live
VERSION=2013.02.11
EXT=tar.gz
BASEURL=http://www.live555.com/liveMedia/public/

. $(dirname $0)/../functions.sh

BUILDDIR=live
FILENAME=live.2013.02.11.tar.gz
LIVEDIST=${PREFIX}/live

pkg_configure()
{
    ./genMakefiles mingw
}

pkg_make_target()
{
    make                            \
    LD=${CROSS_PREFIX}ld            \
    CC=${CROSS_PREFIX}gcc           \
    CXX=${CROSS_PREFIX}g++          \
    CFLAGS="${GLOBAL_CFLAGS}"       \
    CXXFLAGS="${GLOBAL_CFLAGS}"     \
    ${MAKEOPTS} || return 1

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
