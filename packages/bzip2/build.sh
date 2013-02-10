#!/bin/sh
PACKAGE=bzip2
VERSION=1.0.6
EXT=tar.gz
BASEURL=http://www.bzip.org/${VERSION}

. $(dirname $0)/../functions.sh

pkg_unpack
apply_patches

( cd ${BUILDDIR} &&                 \
    AR=${CROSS_PREFIX}ar            \
    RANLIB=${CROSS_PREFIX}ranlib    \
    CC=${CROSS_PREFIX}gcc           \
    CFLAGS=${GLOBAL_CFLAGS}         \
    make ${MAKEOPTS} )

install -m644 ${BUILDDIR}/libbz2.a ${PREFIX}/lib/libbz2.a
install -m644 ${BUILDDIR}/bzlib.h ${PREFIX}/include/bzlib.h

pkg_clean
