#!/bin/bash
# Build script for Codec 2 speech audio codec
# Copyright (c) 2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=codec2
VERSION=0.7
EXT=tar.xz
BASEURL=http://ftp.debian.org/debian/pool/main/c/codec2

. $(dirname $0)/../functions.sh

FILENAME=${PACKAGE}_${VERSION}.orig.${EXT}

CMAKE=1
CMAKEOPTS="-DBUILD_SHARED_LIBS=OFF -DUNITTEST=OFF"

pkg_make_target()
{
    # avoid multiple definitions with speex when using lto
    sed -i -e 's/lpc_to_lsp/lpc_to_lsp_c2/g' src/*.c src/*.h unittest/*.c
    sed -i -e 's/lsp_to_lpc/lsp_to_lpc_c2/g' src/*.c src/*.h unittest/*.c

    # TODO: make an hook in functions.sh instead
    make -C cross_build ${MAKEOPTS} install
}

pkg_build && pkg_clean
