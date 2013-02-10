#!/bin/sh

. $(dirname $0)/../functions.sh

CONFOPTS="--cross-prefix=${HOST}-"

BUILDDIR=x264
git_clean && pkg_build && git_clean
