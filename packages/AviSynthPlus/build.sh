#!/bin/bash
# Build script for AviSynthPlus (headers only)
# Copyright (c) 2020 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO=https://github.com/AviSynth/AviSynthPlus.git

. $(dirname $0)/../functions.sh

BUILDDIR="AviSynthPlus"

CMAKE=1
CMAKEOPTS="-DHEADERS_ONLY:bool=on"

git_clean && pkg_build && git_clean
