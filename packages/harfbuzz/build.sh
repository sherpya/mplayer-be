#!/bin/bash
# Build script for HarfBuzz
# Copyright (c) 2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=harfbuzz
VERSION=2.0.2
EXT=tar.bz2
BASEURL=https://www.freedesktop.org/software/harfbuzz/release

. $(dirname $0)/../functions.sh

depends lib/libfreetype.a

CMAKE=1
CMAKEOPTS="-DBUILD_SHARED_LIBS=OFF -DHB_HAVE_FREETYPE=ON"

# HB_HAVE_UNISCRIBE
# HB_HAVE_DIRECTWRITE

pkg_build && pkg_clean
