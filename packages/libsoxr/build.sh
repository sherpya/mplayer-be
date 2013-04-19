#!/bin/bash
# Build script for SoX Resampler
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=soxr
VERSION=0.1.1-Source
EXT=tar.xz
BASEURL=http://downloads.sourceforge.net/project/${PACKAGE}

CMAKE=1
CMAKEOPTS=" \
    -DHAVE_WORDS_BIGENDIAN_EXITCODE=1   \
    -DBUILD_TESTS=0                     \
    -DBUILD_EXAMPLES=0"

. $(dirname $0)/../functions.sh

pkg_build && pkg_clean
