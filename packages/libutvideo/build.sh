#!/bin/bash

. $(dirname $0)/../functions.sh

case ${ARCH} in
    x86) ASM=x86 ;;
    x86_64) ASM=x64 ;;
esac

BUILDDIR=libutvideo
STATICLIBS="libutvideo"
GIT_REPO="git://github.com/qyot27/libutvideo.git"

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
