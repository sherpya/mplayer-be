#!/bin/bash
# Build script for z.lib (Scaling, colorspace conversion, and dithering)
# Copyright (c) 2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO=https://github.com/sekrit-twc/zimg.git

. $(dirname $0)/../functions.sh

BUILDDIR="zimg"
STATICLIBS="libzimg"

git_clean && pkg_build && git_clean
