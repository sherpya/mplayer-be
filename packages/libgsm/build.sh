#!/bin/sh
PACKAGE=gsm
VERSION=1.0-pl13
EXT=tar.xz
BASEURL=local

. $(dirname $0)/../functions.sh

pkg_unpack
apply_patches

( cd ${BUILDDIR} &&                 \
    AR=${CROSS_PREFIX}ar            \
    RANLIB=${CROSS_PREFIX}ranlib    \
    CC=${CROSS_PREFIX}gcc           \
    CFLAGS=${GLOBAL_CFLAGS}         \
    make ${MAKEOPTS} lib/libgsm.a )

install -m644 ${BUILDDIR}/lib/libgsm.a ${PREFIX}/lib/libgsm.a
install -m644 -D ${BUILDDIR}/inc/gsm.h ${PREFIX}/include/gsm/gsm.h

pkg_clean
