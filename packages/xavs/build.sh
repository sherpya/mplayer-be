#!/bin/sh

. $(dirname $0)/../functions.sh

BUILDDIR=xavs
SVN_REPO="https://xavs.svn.sourceforge.net/svnroot/xavs/trunk"

pkg_configure()
{
    AR=${CROSS_PREFIX}ar            \
    RANLIB=${CROSS_PREFIX}ranlib    \
    STRIP=${CROSS_PREFIX}strip      \
    CC=${CROSS_PREFIX}gcc           \
    CFLAGS=${GLOBAL_CFLAGS}         \
    ./configure --host=${HOST}
}

pkg_make_target()
{
    make ${MAKEOPTS} libxavs.a
    install -m644 libxavs.a ${PREFIX}/lib/libxavs.a
    install -m644 xavs.h ${PREFIX}/include/xavs.h
    install -m644 xavs.pc ${PREFIX}/lib/pkgconfig/xavs.pc
}

distclean && pkg_build && distclean
