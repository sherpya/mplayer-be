#!/bin/bash
GIT_REPO="git://github.com/dekkers/libilbc.git"

. $(dirname $0)/../functions.sh

BUILDDIR=libilbc
STATICLIBS="libilbc"

distclean && pkg_build && distclean
