#!/bin/bash
# Build script for x264 H.264/MPEG-4 AVC Encoder
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO=https://code.videolan.org/videolan/x264.git

. $(dirname $0)/../functions.sh

BUILDDIR="x264"
CONFOPTS="--disable-cli --cross-prefix=${HOST}-"

pkg_make_target()
{
    make ${MAKEOPTS} install-lib-dev install-lib-static
}

git_clean && pkg_build && git_clean
