#!/bin/bash
PACKAGE=libtheora
VERSION=1.2.0alpha1
EXT=tar.xz
BASEURL=http://downloads.xiph.org/releases/theora

. $(dirname $0)/../functions.sh

depends lib/libogg.a
depends lib/libvorbis.a
depends lib/libpng.a

STATICLIBS="libtheora libtheoraenc libtheoradec"

pkg_build && pkg_clean
