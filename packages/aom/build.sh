#!/bin/bash
# Build script for aom AV1 Codec Library
# Copyright (c) 2019 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO=https://aomedia.googlesource.com/aom

. $(dirname $0)/../functions.sh

BUILDDIR="aom"

CMAKE=1
CMAKEOPTS="-DENABLE_SHARED=OFF -DENABLE_EXAMPLES=OFF -DENABLE_TESTS=OFF -DENABLE_TOOLS=OFF"

git_clean && pkg_build && git_clean
