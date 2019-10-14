#!/bin/bash
# Build script for libmpg123
# Copyright (c) 2018-2019 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=mpg123
VERSION=1.25.12
EXT=tar.bz2
BASEURL=http://downloads.sourceforge.net/project/${PACKAGE}/${PACKAGE}/${VERSION}

. $(dirname $0)/../functions.sh

STATICLIBS="libmpg123 libout123"
CONFOPTS="--enable-yasm"

pkg_build && pkg_clean
