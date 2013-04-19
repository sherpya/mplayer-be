#!/bin/bash
PACKAGE=fontconfig
VERSION=2.10.2
EXT=tar.bz2
BASEURL=http://www.freedesktop.org/software/fontconfig/release

. $(dirname $0)/../functions.sh

CONFOPTS="--with-cache-dir=LOCAL_APPDATA_FONTCONFIG_CACHE --with-configdir=conf.d"

depends lib/libfreetype.a
depends lib/libexpat.a

STATICLIBS="libfontconfig"

export ac_cv_func__mktemp_s=no

pkg_build && pkg_clean
