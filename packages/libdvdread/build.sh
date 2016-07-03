#!/bin/bash
# Build script for libdvdread library
# Copyright (c) 2014 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO="http://code.videolan.org/videolan/libdvdread.git"

. $(dirname $0)/../functions.sh

depends lib/libdvdcss.a

BUILDDIR=libdvdread
STATICLIBS="libdvdread"
CONFOPTS="--with-libdvdcss --disable-apidoc"

git_clean && pkg_build && git_clean
