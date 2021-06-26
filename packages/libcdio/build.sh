#!/bin/bash
# Build script for GNU Compact Disc Input and Control Library
# Copyright (c) 2013-2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO=https://git.savannah.gnu.org/git/libcdio.git

__USE_MINGW_ANSI_STDIO=1

. $(dirname $0)/../functions.sh

depends lib/libiconv.a
depends lib/libcddb.a

BUILDDIR="libcdio"
STATICLIBS="libcdio libcdio++ libiso9660 libiso9660++ libudf"

git_clean && pkg_build && git_clean
