#!/bin/bash
# Build script for XVID Video Codec
# Copyright (c) 2013-2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=xvidcore
VERSION=1.3.5
EXT=tar.gz
BASEURL=https://downloads.xvid.com/downloads

. $(dirname $0)/../functions.sh

BUILDDIR=xvidcore
BUILDSUBDIR=build/generic

export_toolchain

_pkg_make_target()
{
    pushd build/generic >/dev/null
    make ${MAKEOPTS} || { popd >/dev/null ; return 1; }
    install -m644 =build/xvidcore.a ${PREFIX}/lib/libxvidcore.a
    install -m644 ../../src/xvid.h ${PREFIX}/include/xvid.h
    popd > /dev/null
}

pkg_build && pkg_clean
