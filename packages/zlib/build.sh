#!/bin/bash
# Build script for zlib data compression library
# Copyright (c) 2013-2021 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=zlib
VERSION=1.2.11
EXT=tar.xz
BASEURL=http://zlib.net

. $(dirname $0)/../functions.sh

pkg_configure()
{
    CFLAGS="${MBE_CFLAGS}" prefix=${PREFIX} ./configure --static || return 1
}

pkg_build && pkg_clean
