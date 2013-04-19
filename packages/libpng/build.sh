#!/bin/bash
PACKAGE=libpng
VERSION=1.5.15
EXT=tar.xz
BASEURL=http://downloads.sourceforge.net/project/libpng/libpng15/${VERSION}

. $(dirname $0)/../functions.sh

depends lib/libz.a

STATICLIBS="libpng libpng15"

pkg_build && pkg_clean
