#!/bin/bash
# Build script for libjpeg-turbo
# Copyright (c) 2013-2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

# 1.5.1 includes fixes for: CVE-2013-6629, CVE-2013-6630

PACKAGE=libjpeg-turbo
VERSION=2.0.1
EXT=tar.gz
BASEURL=http://downloads.sourceforge.net/project/${PACKAGE}/${VERSION}

. $(dirname $0)/../functions.sh

CMAKE=1
CMAKEOPTS="-DENABLE_SHARED=OFF"

#STATICLIBS="libjpeg libturbojpeg"

pkg_build && pkg_clean
