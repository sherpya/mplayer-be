#!/bin/bash
# Build script for libdvdcss
# Copyright (c) 2014 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO="git://git.videolan.org/libdvdcss.git"

. $(dirname $0)/../functions.sh

BUILDDIR=libdvdcss
STATICLIBS="libdvdcss"
CFLAGS="-Wno-error=pointer-to-int-cast"
CONFOPTS="--disable-doc"

git_clean && pkg_build && git_clean
