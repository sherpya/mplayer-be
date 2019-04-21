#!/bin/bash
# Build script for Google VP8/9 Video Codec
# Copyright (c) 2013-2019 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO=https://chromium.googlesource.com/webm/libvpx.git
MARCH=i686

. $(dirname $0)/../functions.sh

case ${ARCH} in
    x86) VPX_TARGET=x86-win32-gcc ;;
    x86_64) VPX_TARGET=x86_64-win64-gcc ;;
esac

BUILDDIR="libvpx"

# package configure fails on unknown options
pkg_configure()
{
    CFLAGS="${GLOBAL_CFLAGS} -fno-asynchronous-unwind-tables" \
    CROSS=${HOST}- ./configure      \
        --prefix=${PREFIX}          \
        --target=${VPX_TARGET}      \
        --enable-static             \
        --disable-shared            \
        --disable-unit-tests        \
        --disable-examples
}

post_install_hook()
{
    gen_ld_script libvpx.a "-lpthread"
}

git_clean && pkg_build && git_clean
