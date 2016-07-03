#!/bin/bash
# Build script for libdvdnav library
# Copyright (c) 2014-2016 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO="http://code.videolan.org/videolan/libdvdnav.git"

. $(dirname $0)/../functions.sh

depends lib/libdvdread.a

BUILDDIR=libdvdnav
STATICLIBS="libdvdnav"

git_clean && pkg_build && git_clean
