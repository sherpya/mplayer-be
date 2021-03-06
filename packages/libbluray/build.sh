#!/bin/bash
# Build script for libbluray
# Copyright (c) 2014-2020 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO=https://code.videolan.org/videolan/libbluray.git

. $(dirname $0)/../functions.sh

depends lib/libxml2.a
depends lib/libfreetype.a

BUILDDIR="libbluray"
STATICLIBS="libbluray"
CONFOPTS="--enable-examples=no --disable-bdjava-jar"

git_clean && pkg_build && git_clean
