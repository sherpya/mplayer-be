#!/bin/sh
PACKAGE=harfbuzz
VERSION=0.9.12
EXT=tar.bz2
BASEURL=http://www.freedesktop.org/software/harfbuzz/release

. $(dirname $0)/../functions.sh

depends lib/libfreetype.a

STATICLIBS="libharfbuzz"

pkg_build && pkg_clean
