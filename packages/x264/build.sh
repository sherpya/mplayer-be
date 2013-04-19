#!/bin/bash
GIT_REPO="git://git.videolan.org/x264.git"

. $(dirname $0)/../functions.sh

BUILDDIR=x264
CONFOPTS="--cross-prefix=${HOST}-"

pkg_make_target()
{
    make ${MAKEOPTS} install-lib-dev install-lib-static
}

git_clean && pkg_build && git_clean
