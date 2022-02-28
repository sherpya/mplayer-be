#!/bin/bash
# Build script for AviSynthPlus (headers only)
# Copyright (c) 2020-2022 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO=https://github.com/AviSynth/AviSynthPlus.git

. $(dirname $0)/../functions.sh

BUILDDIR="AviSynthPlus"

CMAKE=1
CMAKEOPTS="-DHEADERS_ONLY:BOOL=ON"
INSTALL_TARGET="VersionGen install"

git_clean && pkg_build && git_clean
