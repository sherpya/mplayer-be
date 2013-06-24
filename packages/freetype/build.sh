#!/bin/bash
# Build script for FreeType library
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=freetype
VERSION=2.5.0.1
EXT=tar.bz2
BASEURL=http://downloads.sourceforge.net/project/${PACKAGE}/freetype2/${VERSION%.*}

. $(dirname $0)/../functions.sh

depends lib/libz.a
depends lib/libbz2.a

STATICLIBS="libfreetype"

pkg_build && pkg_clean
