#!/bin/bash
# Build script for GNU Compact Disc Input and Control Library (cdparanoia)
# Copyright (c) 2013-2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO=https://github.com/rocky/libcdio-paranoia.git

. $(dirname $0)/../functions.sh

depends lib/libcdio.a

BUILDDIR="libcdio-paranoia"
STATICLIBS="libcdio_cdda libcdio_paranoia"

git_clean && pkg_build && git_clean
