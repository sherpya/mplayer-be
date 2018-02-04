#!/bin/bash
# Build script for Cisco's Open Source H.264 Codec
# Copyright (c) 2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO="https://github.com/cisco/openh264.git"
MARCH=i686

. $(dirname $0)/../functions.sh

BUILDDIR=openh264

export_toolchain

# TODO: to be fixed?
GLOBAL_CFLAGS="${GLOBAL_CFLAGS} -Wno-error=format -Wno-error=format-extra-args"

pkg_make_target()
{
    make ${MAKEOPTS}                \
    PREFIX=${PREFIX}                \
    AR=${CROSS_PREFIX}ar            \
    RANLIB=${CROSS_PREFIX}ranlib    \
    CC=${CROSS_PREFIX}gcc           \
    CFLAGS="${GLOBAL_CFLAGS}"       \
    CXXFLAGS="${GLOBAL_CFLAGS}"     \
    OS=mingw_nt ARCH=${ARCH}        \
    install-static
}

git_clean && pkg_build && git_clean
