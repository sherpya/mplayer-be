#!/bin/sh
PACKAGE=faac
VERSION=1.28
EXT=tar.bz2
BASEURL=http://downloads.sourceforge.net/project/faac/faac-src/faac-1.28

. $(dirname $0)/../functions.sh

# for binary dll
# configure with --with-mp3v2=no
# go into libfaac and make
# then ${HOST}-dllwrap -d libfaac.def --dllname libfaac.dll .libs/libfaac.a

pkg_unpack
install -m644 ${BUILDDIR}/include/faac.h ${PREFIX}/include/faac.h
install -m644 ${BUILDDIR}/include/faaccfg.h ${PREFIX}/include/faaccfg.h
pkg_clean
