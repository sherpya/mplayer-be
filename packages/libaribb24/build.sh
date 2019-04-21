#!/bin/bash
# Build script for aribb24 library
# Copyright (c) 2019 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO=https://github.com/nkoriyama/aribb24.git

. $(dirname $0)/../functions.sh

depends lib/libpng.a

BUILDDIR="libaribb24"
STATICLIBS="libaribb24"

git_clean && pkg_build && git_clean
