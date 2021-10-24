#!/bin/bash
# Build script for libass subtitle renderer
# Copyright (c) 2013-2021 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO=https://github.com/libass/libass.git

__USE_MINGW_ANSI_STDIO=1

. $(dirname $0)/../functions.sh

depends lib/libfreetype.a
depends lib/libfribidi.a
depends lib/libharfbuzz.a
depends lib/libfontconfig.a
depends lib/libenca.a

BUILDDIR="libass"
STATICLIBS="libass"

git_clean && pkg_build && git_clean
