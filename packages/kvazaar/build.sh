#!/bin/bash
# Build script for kvazaar library
# Copyright (c) 2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO=https://github.com/ultravideo/kvazaar.git

__USE_MINGW_ANSI_STDIO=1

. $(dirname $0)/../functions.sh

BUILDDIR="kvazaar"
STATICLIBS="libkvazaar"

git_clean && pkg_build && git_clean
