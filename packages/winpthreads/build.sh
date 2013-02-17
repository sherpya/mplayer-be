#!/bin/sh

. $(dirname $0)/../functions.sh

BUILDDIR=winpthreads
STATICLIBS="libwinpthread"

distclean && pkg_build && distclean
