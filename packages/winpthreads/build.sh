#!/bin/bash

. $(dirname $0)/../functions.sh

BUILDDIR=winpthreads
STATICLIBS="libwinpthread"
SVN_REPO="https://mingw-w64.svn.sourceforge.net/svnroot/mingw-w64/trunk/mingw-w64-libraries/winpthreads"

distclean && pkg_build && distclean
