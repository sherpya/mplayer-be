#!/bin/sh

. $(dirname $0)/../functions.sh

BUILDDIR=libvpx

git_clean

( cd ${BUILDDIR} && \
    CROSS=${HOST}- ./configure      \
        --prefix=${PREFIX}          \
        --target=x86-win32-gcc      \
        --enable-static             \
        --disable-shared            \
        --disable-examples
)

pkg_build || exit 1
git_clean
