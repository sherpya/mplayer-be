#!/bin/bash

. $(dirname $0)/../functions.sh

BUILDDIR=dlfcn-win32
SVN_REPO="http://dlfcn-win32.googlecode.com/svn/trunk"

# why configure returns false?
pkg_configure()
{
    ./configure             \
        --prefix=${PREFIX}  \
        --cross-prefix=${CROSS_PREFIX} || return 0
}

pkg_make_target()
{
    make ${MAKEOPTS}
    make ${MAKEOPTS} install
}

distclean && pkg_build && distclean
