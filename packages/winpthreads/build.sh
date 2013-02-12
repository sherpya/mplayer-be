#!/bin/sh

. $(dirname $0)/../functions.sh

BUILDDIR=winpthreads
distclean

STATICLIBS="libwinpthread"

pkg_build
