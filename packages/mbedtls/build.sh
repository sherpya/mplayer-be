#!/bin/bash
# Build script for mbedtls data compressor
# Copyright (c) 2019-2021 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=mbedtls
VERSION=2.27.0
EXT=tar.gz
BASEURL=https://github.com/ARMmbed/mbedtls/archive/refs/tags

. $(dirname $0)/../functions.sh

FILENAME="v${VERSION}.${EXT}"

depends lib/libz.a

CMAKE=1
CMAKEOPTS="-DENABLE_PROGRAMS=OFF -DENABLE_ZLIB_SUPPORT=ON -DENABLE_TESTING=OFF"

pkg_build && pkg_clean
