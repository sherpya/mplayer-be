#!/bin/bash
# Build script for OGG Open Container Format
# Copyright (c) 2013-2017 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=libogg
VERSION=1.3.3
EXT=tar.xz
BASEURL=http://downloads.xiph.org/releases/ogg

. $(dirname $0)/../functions.sh

STATICLIBS="libogg"

# eh?
export ac_cv_sizeof_u_int16_t=2
export ac_cv_sizeof_u_int32_t=4

pkg_build && pkg_clean
