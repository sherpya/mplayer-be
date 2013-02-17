#!/bin/sh

. $(dirname $0)/../functions.sh

case ${HOST} in
    i?86-*-mingw32) VPX_TARGET=x86-win32-gcc ;;
    x86_64-*-mingw32) VPX_TARGET=x86_64-win64-gcc ;;
esac

BUILDDIR=libvpx

pkg_configure()
{
    CROSS=${HOST}- ./configure      \
        --prefix=${PREFIX}          \
        --target=${VPX_TARGET}      \
        --enable-static             \
        --disable-shared            \
        --disable-examples
}

git_clean && pkg_build
