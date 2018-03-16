#!/bin/bash
# Build script for FFmpeg headers for Nvidias codec APIs
# Copyright (c) 2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO=https://git.videolan.org/git/ffmpeg/nv-codec-headers.git

. $(dirname $0)/../functions.sh

BUILDDIR="nv-codec-headers"

pkg_make_target()
{
    make PREFIX=${PREFIX} install
}

git_clean && pkg_build && git_clean
