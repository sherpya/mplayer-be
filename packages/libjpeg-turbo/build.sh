#!/bin/bash
# Build script for libjpeg-turbo
# Copyright (c) 2013-2021 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=libjpeg-turbo
VERSION=2.1.0
EXT=tar.gz
BASEURL=http://downloads.sourceforge.net/project/${PACKAGE}/${VERSION}

. $(dirname $0)/../functions.sh

CMAKE=1
CMAKEOPTS="-DENABLE_SHARED=OFF"

pkg_build && pkg_clean
