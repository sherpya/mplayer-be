#!/bin/bash
# Build script for GNU libiconv
# Copyright (c) 2013-2025 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=libiconv
VERSION=1.18
EXT=tar.gz
BASEURL=http://ftp.gnu.org/pub/gnu/${PACKAGE}

. $(dirname $0)/../functions.sh

STATICLIBS="libiconv"
CONFOPTS="--disable-nls"
[ "${ARCH}" = "x86" ] && CONFOPTS+=" --disable-year2038"

CFLAGS="-include stdint.h"

pkg_make_target()
{
    # llp64
    sed -i -e 's/(int)(long)\&/(int)(intptr_t)\&/g' lib/*.{c,h}
    sed -i -e 's/(unsigned long)/(uintptr_t)/g' srclib/malloca.c

    make ${MAKEOPTS} install-lib
}

pkg_build && pkg_clean
