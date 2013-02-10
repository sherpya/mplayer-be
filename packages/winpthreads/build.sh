#!/bin/sh

. $(dirname $0)/../functions.sh

BUILDDIR=winpthreads
distclean
pkg_build
