#!/bin/bash
# Build script for Google VP8/9 Video Codec
# Copyright (c) 2013-2016 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO="https://chromium.googlesource.com/webm/libvpx.git"
MARCH=i686

. $(dirname $0)/../functions.sh

case ${ARCH} in
    x86) VPX_TARGET=x86-win32-gcc ;;
    x86_64) VPX_TARGET=x86_64-win64-gcc ;;
esac

BUILDDIR=libvpx

pkg_configure()
{
    CFLAGS="${GLOBAL_CFLAGS}"       \
    CROSS=${HOST}- ./configure      \
        --prefix=${PREFIX}          \
        --target=${VPX_TARGET}      \
        --enable-static             \
        --disable-shared            \
        --disable-unit-tests        \
        --disable-examples
}

git_clean && pkg_build && ( gen_ld_script libvpx.a -lpthread ) && git_clean
