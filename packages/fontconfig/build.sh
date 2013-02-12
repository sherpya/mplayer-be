#!/bin/sh
PACKAGE=fontconfig
VERSION=2.10.91
EXT=tar.bz2
BASEURL=http://www.freedesktop.org/software/fontconfig/release

. $(dirname $0)/../functions.sh

CONFOPTS="--with-cache-dir=LOCAL_APPDATA_FONTCONFIG_CACHE --with-configdir=conf.d"

depends lib/libfreetype.a
depends lib/libexpat.a

STATICLIBS="libfontconfig"

pkg_build && pkg_clean
