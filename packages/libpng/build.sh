#!/bin/bash
# Build script for libpng library
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=libpng
VERSION=1.5.16
EXT=tar.xz
BASEURL=http://downloads.sourceforge.net/project/${PACKAGE}/libpng15/${VERSION}

. $(dirname $0)/../functions.sh

depends lib/libz.a

STATICLIBS="libpng libpng15"

pkg_build && pkg_clean
