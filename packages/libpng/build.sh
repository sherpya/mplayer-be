#!/bin/sh
PACKAGE=libpng
VERSION=1.5.14
EXT=tar.xz
BASEURL=http://downloads.sourceforge.net/project/libpng/libpng15/1.5.14

. $(dirname $0)/../functions.sh

depends lib/libz.a

STATICLIBS="libpng libpng15"

pkg_build && pkg_clean
