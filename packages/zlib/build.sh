#!/bin/bash
# Build script for zlib data compression library
# Copyright (c) 2013-2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=zlib
VERSION=1.2.11
EXT=tar.xz
BASEURL=http://zlib.net

. $(dirname $0)/../functions.sh

export_toolchain

pkg_configure()
{
    CFLAGS="${GLOBAL_CFLAGS}" ./configure --static || return 1
}

pkg_make_target()
{
    make ${MAKEOPTS} libz.a || return 1

    install -m644 libz.a ${PREFIX}/lib/libz.a
    install -m644 zlib.h ${PREFIX}/include/zlib.h
    install -m644 zconf.h ${PREFIX}/include/zconf.h
}

pkg_build && pkg_clean
