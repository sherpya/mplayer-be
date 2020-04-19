#!/bin/bash
# Build script for libdca free DTS Decoder
# Copyright (c) 2013-2020 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=libdca
VERSION=0.0.7
EXT=tar.bz2
BASEURL=http://download.videolan.org/pub/videolan/${PACKAGE}/${VERSION}

. $(dirname $0)/../functions.sh

#CFLAGS="-D__NO_INLINE__"
STATICLIBS="libdca"

pkg_build && pkg_clean
