#!/bin/bash
# Build script for Internet Low Bitrate Codec (iLBC) library
# Copyright (c) 2013-2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO=https://github.com/dekkers/libilbc.git

. $(dirname $0)/../functions.sh

BUILDDIR="libilbc"

CMAKE=1
CMAKEOPTS="-DBUILD_SHARED_LIBS=OFF"

git_clean && pkg_build && git_clean
