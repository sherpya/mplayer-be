#!/bin/bash
# Build script for libdvdcss
# Copyright (c) 2014 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO="git://git.videolan.org/libdvdcss.git"

. $(dirname $0)/../functions.sh

CONFOPTS="--disable-doc"
BUILDDIR=libdvdcss
STATICLIBS="libdvdcss"

git_clean && pkg_build && git_clean
