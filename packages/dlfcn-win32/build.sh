#!/bin/bash
# Build script for dlfcn wrapper for win32
# Copyright (c) 2013-2016 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO="https://github.com/dlfcn-win32/dlfcn-win32"

. $(dirname $0)/../functions.sh

BUILDDIR=dlfcn-win32

pkg_configure()
{
    ./configure                 \
        --prefix=${PREFIX}      \
        --disable-wine          \
        --cross-prefix=${CROSS_PREFIX}
}

pkg_make_target()
{
    CFLAGS="${GLOBAL_CFLAGS}" make V=1 ${MAKEOPTS}
    make ${MAKEOPTS} install
}

git_clean && pkg_build && git_clean
