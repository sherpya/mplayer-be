#!/bin/sh
PACKAGE=freetype
VERSION=2.4.11
EXT=tar.bz2
BASEURL=http://downloads.sourceforge.net/project/freetype/freetype2/2.4.11

. $(dirname $0)/../functions.sh

depends lib/libz.a
depends lib/libbz2.a

STATICLIBS="libfreetype"

pkg_build && pkg_clean
