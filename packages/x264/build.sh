#!/bin/sh

. $(dirname $0)/../functions.sh

CONFOPTS="--cross-prefix=${HOST}-"

BUILDDIR=x264

pkg_make_target()
{
    make ${MAKEOPTS} install-lib-dev install-lib-static
}

git_clean && pkg_build && git_clean
