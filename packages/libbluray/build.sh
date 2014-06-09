#!/bin/bash
# Build script for libbluray
# Copyright (c) 2014 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO="git://git.videolan.org/libbluray.git"

. $(dirname $0)/../functions.sh

depends lib/libxml2.a
depends lib/libfreetype.a

BUILDDIR="libbluray"
STATICLIBS="libbluray"
CONFOPTS="--enable-examples=no"

git_clean && pkg_build && git_clean
