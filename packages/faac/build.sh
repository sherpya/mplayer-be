#!/bin/sh
PACKAGE=faac
VERSION=1.28
EXT=tar.bz2
BASEURL=http://downloads.sourceforge.net/project/faac/faac-src/faac-1.28

. $(dirname $0)/../functions.sh

# headers only
#CONFOPTS="--with-mp4v2=no"
#pkg_build && pkg_clean

pkg_unpack
install -m644 ${BUILDDIR}/include/faac.h ${PREFIX}/include/faac.h
install -m644 ${BUILDDIR}/include/faaccfg.h ${PREFIX}/include/faaccfg.h
pkg_clean
