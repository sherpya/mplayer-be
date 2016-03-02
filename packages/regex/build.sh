#!/bin/bash
# Build script for GNU regex
# Copyright (c) 2013-2016 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=regex
VERSION=0.12
EXT=tar.gz
BASEURL=http://ftp.gnu.org/old-gnu/${PACKAGE}

. $(dirname $0)/../functions.sh

pkg_configure()
{
    : # skip
}

pkg_make_target()
{
    cmd ${CROSS_PREFIX}gcc ${GLOBAL_CFLAGS} -DSTDC_HEADERS=1 -DHAVE_STRING_H=1 -c regex.c -o regex.o
    cmd ${CROSS_PREFIX}ar cr libregex.a regex.o
    cmd ${CROSS_PREFIX}ranlib libregex.a

    cmd install -m644 libregex.a ${PREFIX}/lib/libregex.a
    cmd install -m644 regex.h ${PREFIX}/include/regex.h
}

pkg_build && pkg_clean
