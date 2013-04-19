#!/bin/bash
# Build script for UT LossLess Video Codec
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO="git://github.com/qyot27/libutvideo.git"

. $(dirname $0)/../functions.sh

case ${ARCH} in
    x86) ASM=x86 ;;
    x86_64) ASM=x64 ;;
esac

BUILDDIR=libutvideo
STATICLIBS="libutvideo"

pkg_configure()
{
    ./configure                             \
        --enable-asm=${ASM}                 \
        --prefix=${PREFIX}                  \
        --cross-prefix=${CROSS_PREFIX}      \
        --extra-cppflags="${GLOBAL_CFLAGS}" \
        --extra-cxxflags="${GLOBAL_CFLAGS}"
}

git_clean && pkg_build && git_clean
