#!/bin/bash
# Build script for gnutls library
# Copyright (c) 2015-2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=gnutls
VERSION=3.5.17
EXT=tar.xz
BASEURL=ftp://ftp.gnutls.org/gcrypt/gnutls/v3.5

. $(dirname $0)/../functions.sh

depends lib/libz.a
depends lib/libregex.a
depends lib/libgmp.a
depends lib/libnettle.a

STATICLIBS="libgnutls libgnutls-openssl"
CONFOPTS=" \
    --disable-silent-rules \
    --disable-nls \
    --disable-doc \
    --disable-guile \
    --disable-tools \
    --disable-tests \
    --disable-libdane \
    --with-included-libtasn1 \
    --with-included-unistring \
    --enable-local-libopts \
    --without-p11-kit"

# please someone decide how to print time_t
GLOBAL_CFLAGS="${GLOBAL_CFLAGS} -Wno-error=format"

export libopts_cv_with_libregex=yes
export libopts_cv_with_libregex_libs=-lregex
export libopts_cv_with_regex_header=regex.h

pkg_build && pkg_clean
