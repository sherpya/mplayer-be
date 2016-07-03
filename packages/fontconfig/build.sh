#!/bin/bash
# Build script for Fontconfig
# Copyright (c) 2013-2016 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=fontconfig
VERSION=2.12.0
EXT=tar.bz2
BASEURL=http://www.freedesktop.org/software/${PACKAGE}/release

. $(dirname $0)/../functions.sh

depends lib/libfreetype.a
depends lib/libexpat.a

STATICLIBS="libfontconfig"
CONFOPTS="--with-cache-dir=LOCAL_APPDATA_FONTCONFIG_CACHE --with-configdir=conf.d"

export ac_cv_func__mktemp_s=no

pkg_build && pkg_clean
