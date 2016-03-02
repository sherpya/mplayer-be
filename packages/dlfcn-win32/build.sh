#!/bin/bash
# Build script for dlfcn wrapper for win32
# Copyright (c) 2013-2016 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

SVN_REPO="http://dlfcn-win32.googlecode.com/svn/trunk"

. $(dirname $0)/../functions.sh

BUILDDIR=dlfcn-win32

# why configure does return false?
pkg_configure()
{
    ./configure                 \
        --prefix=${PREFIX}      \
        --disable-wine          \
        --cross-prefix=${CROSS_PREFIX} || return 0
}

pkg_make_target()
{
    CFLAGS="${GLOBAL_CFLAGS}" make ${MAKEOPTS}
    make ${MAKEOPTS} install
}

distclean && svn_clean && pkg_build && distclean && svn_clean
