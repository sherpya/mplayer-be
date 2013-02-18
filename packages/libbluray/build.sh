#!/bin/sh

. $(dirname $0)/../functions.sh

CONFOPTS="--enable-examples=no"
BUILDDIR=libbluray
GIT_REPO="git://git.videolan.org/libbluray.git"

STATICLIBS="libbluray"

distclean && pkg_build && distclean
