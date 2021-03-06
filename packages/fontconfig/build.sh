#!/bin/bash
# Build script for Fontconfig
# Copyright (c) 2013-2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

# 2.12.1 includes fixes for:
# CVE-2016-5384

PACKAGE=fontconfig
VERSION=2.13.1
EXT=tar.gz
BASEURL=http://fontconfig.org/release

. $(dirname $0)/../functions.sh

depends lib/libfreetype.a
depends lib/libexpat.a

STATICLIBS="libfontconfig"
CONFOPTS="--with-cache-dir=LOCAL_APPDATA_FONTCONFIG_CACHE --with-configdir=conf.d"

export ac_cv_func__mktemp_s=no

pkg_build && pkg_clean
