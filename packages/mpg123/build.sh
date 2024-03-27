#!/bin/bash
# Build script for libmpg123
# Copyright (c) 2018-2024 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=mpg123
VERSION=1.32.5
EXT=tar.bz2
BASEURL=http://downloads.sourceforge.net/project/${PACKAGE}/${PACKAGE}/${VERSION}

__USE_MINGW_ANSI_STDIO=1

. $(dirname $0)/../functions.sh

STATICLIBS="libmpg123 libout123 libsyn123"

pkg_build && pkg_clean
