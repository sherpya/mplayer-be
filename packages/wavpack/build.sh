#!/bin/bash
# Build script for WavPack
# Copyright (c) 2014-2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO=https://github.com/dbry/WavPack.git

. $(dirname $0)/../functions.sh

BUILDDIR=WavPack
STATICLIBS="libwavpack"
CONFOPTS="--disable-apps"

git_clean && pkg_build && git_clean
