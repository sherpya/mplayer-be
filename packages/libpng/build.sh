#!/bin/bash
# Build script for libpng library
# Copyright (c) 2013-2019 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=libpng
VERSION=1.6.29
EXT=tar.xz
BASEURL=http://downloads.sourceforge.net/project/${PACKAGE}/libpng16/${VERSION}

. $(dirname $0)/../functions.sh

depends lib/libz.a

STATICLIBS="libpng libpng16"

pkg_build && pkg_clean
