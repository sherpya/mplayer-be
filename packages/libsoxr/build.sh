#!/bin/bash
# Build script for SoX Resampler
# Copyright (c) 2013-2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=soxr
VERSION=0.1.3-Source
EXT=tar.xz
BASEURL=http://downloads.sourceforge.net/project/${PACKAGE}

CMAKE=1
CMAKEOPTS="\
    -DBUILD_SHARED_LIBS=OFF \
    -DWITH_OPENMP=OFF \
    -DBUILD_TESTS=OFF \
    -DBUILD_EXAMPLES=OFF"

. $(dirname $0)/../functions.sh

pkg_build && pkg_clean
