#!/bin/sh

. $(dirname $0)/../functions.sh

CONFOPTS="--enable-examples=no"
BUILDDIR=libbluray

STATICLIBS="libbluray"

distclean && pkg_build && distclean
