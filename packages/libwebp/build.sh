#!/bin/bash
# Build script for libwebp
# Copyright (c) 2014-2019 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=libwebp
VERSION=1.0.2
EXT=tar.gz
BASEURL=https://storage.googleapis.com/downloads.webmproject.org/releases/webp

. $(dirname $0)/../functions.sh

STATICLIBS="libwebp"
CONFOPTS="\
    --disable-gl \
    --disable-sdl \
    --disable-png \
    --disable-jpeg \
    --disable-tiff \
    --disable-gif \
    --disable-wic"

pkg_build && pkg_clean
