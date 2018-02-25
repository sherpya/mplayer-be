#!/bin/bash
# Build script for GNU Compact Disc Input and Control Library
# Copyright (c) 2013-2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO="https://git.savannah.gnu.org/git/libcdio.git"

. $(dirname $0)/../functions.sh

depends lib/libiconv.a
depends lib/libcddb.a

BUILDDIR=libcdio
STATICLIBS="libcdio libcdio++ libiso9660 libiso9660++ libudf"

git_clean && pkg_build && git_clean
