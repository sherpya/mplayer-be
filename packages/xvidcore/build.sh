#!/bin/bash
PACKAGE=xvidcore
VERSION=1.3.2
EXT=tar.bz2
BASEURL=http://downloads.xvid.org/downloads

. $(dirname $0)/../functions.sh

BUILDDIR=xvidcore
CC=${CROSS_PREFIX}gcc

save_function pkg_configure do_pkg_configure
pkg_configure()
{
    ( cd build/generic && do_pkg_configure $* )
}

pkg_make_target()
{
    pushd build/generic >/dev/null
    make ${MAKEOPTS} || { popd >/dev/null ; return 1; }
    install -m644 =build/xvidcore.a ${PREFIX}/lib/libxvidcore.a
    install -m644 ../../src/xvid.h ${PREFIX}/include/xvid.h
    popd > /dev/null
}

pkg_build && pkg_clean
