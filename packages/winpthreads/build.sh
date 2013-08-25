#!/bin/bash
# Build script for winpthreads
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

SVN_REPO="https://svn.code.sf.net/p/mingw-w64/code/trunk/mingw-w64-libraries/winpthreads"

. $(dirname $0)/../functions.sh

BUILDDIR=winpthreads
STATICLIBS="libwinpthread"

distclean && pkg_build && distclean
