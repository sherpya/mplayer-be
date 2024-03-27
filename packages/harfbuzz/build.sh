#!/bin/bash
# Build script for HarfBuzz
# Copyright (c) 2018-2024 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=harfbuzz
VERSION=8.3.1
EXT=tar.xz
BASEURL=https://github.com/harfbuzz/harfbuzz/releases/download/${VERSION}

. $(dirname $0)/../functions.sh

depends lib/libfreetype.a

CMAKE=1
CMAKEOPTS="-DBUILD_SHARED_LIBS=OFF -DHB_HAVE_FREETYPE=ON"

# HB_HAVE_UNISCRIBE
# HB_HAVE_DIRECTWRITE

pkg_build && pkg_clean
