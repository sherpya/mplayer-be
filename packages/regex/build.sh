#!/bin/bash
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
    echo -n "Building..."
    ${CROSS_PREFIX}gcc -DSTDC_HEADERS=1 -DHAVE_STRING_H=1 -c regex.c -o regex.o
    ${CROSS_PREFIX}ar cru libregex.a regex.o
    ${CROSS_PREFIX}ranlib libregex.a
    echo "done"

    echo -n "Installing..."
    install -m644 libregex.a ${PREFIX}/lib/libregex.a
    install -m644 regex.h ${PREFIX}/include/regex.h
    echo "done"
}

pkg_build && pkg_clean
