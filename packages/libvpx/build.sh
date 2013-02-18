#!/bin/sh

. $(dirname $0)/../functions.sh

case ${ARCH} in
    x86) VPX_TARGET=x86-win32-gcc ;;
    x86_64) VPX_TARGET=x86_64-win64-gcc ;;
esac

BUILDDIR=libvpx
GIT_REPO="http://git.chromium.org/webm/libvpx.git"

pkg_configure()
{
    CROSS=${HOST}- ./configure      \
        --prefix=${PREFIX}          \
        --target=${VPX_TARGET}      \
        --enable-static             \
        --disable-shared            \
        --disable-examples
}

git_clean && pkg_build && git_clean
