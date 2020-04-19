#!/bin/bash
# Build script for mbedtls data compressor
# Copyright (c) 2019-2020 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=mbedtls
VERSION=2.16.6
BASEURL=https://tls.mbed.org/download

. $(dirname $0)/../functions.sh

depends lib/libz.a

FILENAME="${PACKAGE}-${VERSION}-apache.tgz"
CMAKE=1
CMAKEOPTS="-DENABLE_PROGRAMS=OFF -DENABLE_ZLIB_SUPPORT=ON"

pkg_build && pkg_clean
