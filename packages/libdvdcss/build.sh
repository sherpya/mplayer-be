#!/bin/bash
# Build script for libdvdcss
# Copyright (c) 2014-2016 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO=https://code.videolan.org/videolan/libdvdcss.git

. $(dirname $0)/../functions.sh

BUILDDIR="libdvdcss"
STATICLIBS="libdvdcss"
CONFOPTS="--disable-doc"

git_clean && pkg_build && git_clean
