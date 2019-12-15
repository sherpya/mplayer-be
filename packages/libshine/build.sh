#!/bin/bash
# Build script for Shine: fast fixed-point mp3 encoding
# Copyright (c) 2019 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO=https://github.com/toots/shine.git

. $(dirname $0)/../functions.sh

BUILDDIR="shine"
STATICLIBS="libshine"

git_clean && pkg_build && git_clean
