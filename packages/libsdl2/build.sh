#!/bin/bash
# Build script for Simple DirectMedia Layer 2 (SDL)
# Copyright (c) 2019-2020 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=SDL2
VERSION=2.0.12
EXT=tar.gz
BASEURL=http://www.libsdl.org/release

. $(dirname $0)/../functions.sh

depends lib/libiconv.a

STATICLIBS="libSDL2 libSDL2main libSDL2_test"

pkg_build && pkg_clean
