#!/bin/bash
SVN_REPO="http://dlfcn-win32.googlecode.com/svn/trunk"

. $(dirname $0)/../functions.sh

BUILDDIR=dlfcn-win32

# why configure does return false?
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
