#!/bin/sh

. $(dirname $0)/../functions.sh

BUILDDIR=libilbc
STATICLIBS="libilbc"

distclean && pkg_build && distclean
