#!/bin/sh

. $(dirname $0)/../functions.sh

BUILDDIR=libilbc
STATICLIBS="libilbc"
GIT_REPO="git://github.com/dekkers/libilbc.git"

distclean && pkg_build && distclean
