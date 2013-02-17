#!/bin/sh

. $(dirname $0)/../functions.sh

case ${HOST} in
    i?86-*-mingw32) VPX_TARGET=x86-win32-gcc ;;
    x86_64-*-mingw32) VPX_TARGET=x86_64-win64-gcc ;;
esac

BUILDDIR=libvpx

git_clean

( cd ${BUILDDIR} && \
    CROSS=${HOST}- ./configure      \
        --prefix=${PREFIX}          \
        --target=${VPX_TARGET}      \
        --enable-static             \
        --disable-shared            \
        --disable-examples
)

pkg_make || exit 1
pkg_install || exit 1
