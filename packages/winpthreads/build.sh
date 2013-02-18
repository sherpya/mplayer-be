#!/bin/sh

. $(dirname $0)/../functions.sh

BUILDDIR=winpthreads
STATICLIBS="libwinpthread"
SVN_REPO="https://mingw-w64.svn.sourceforge.net/svnroot/mingw-w64/experimental/winpthreads"

distclean && pkg_build && distclean
