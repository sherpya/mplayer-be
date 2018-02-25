#!/bin/bash
# Build script for openssl library
# Copyright (c) 2015 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=openssl
VERSION=1.0.2d
EXT=tar.gz
BASEURL=https://www.openssl.org/source

. $(dirname $0)/../functions.sh

case ${ARCH} in
    x86) OS=mingw ;;
    x86_64) OS=mingw64 ;;
esac

pkg_configure()
{
    CROSS_COMPILE="${HOST}-" ./Configure ${OS} \
    no-shared no-dso \
    --prefix=${PREFIX}
}

pkg_make_target()
{
    make ${MAKEOPTS} || return 1
    make install_sw || return 1
}

pkg_build && pkg_clean
