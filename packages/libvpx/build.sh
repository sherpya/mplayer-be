#!/bin/bash
# Build script for Google VP8/9 Video Codec
# Copyright (c) 2013-2021 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO=https://chromium.googlesource.com/webm/libvpx.git

. $(dirname $0)/../functions.sh

case ${ARCH} in
    x86) VPX_TARGET=x86-win32-gcc ;;
    x86_64) VPX_TARGET=x86_64-win64-gcc ;;
esac

BUILDDIR="libvpx"

# -fno-asynchronous-unwind-tables ??

# package configure fails on unknown options
pkg_configure()
{
    CROSS=${HOST}- ./configure          \
        --prefix=${PREFIX}              \
        --target=${VPX_TARGET}          \
        --enable-static                 \
        --disable-shared                \
        --disable-unit-tests            \
        --disable-examples              \
        --extra-cflags="${MBE_CFLAGS}"  \
        --extra-cxxflags="${MBE_CXXFLAGS}"
}

post_install_hook()
{
    gen_ld_script libvpx.a "-lpthread"
}

git_clean && pkg_build && git_clean
