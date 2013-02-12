#!/bin/sh
PACKAGE=SDL
VERSION=1.2.15
EXT=tar.gz
BASEURL=http://www.libsdl.org/release

. $(dirname $0)/../functions.sh

depends lib/libiconv.a

STATICLIBS="libSDL libSDLmain"

pkg_build && pkg_clean
