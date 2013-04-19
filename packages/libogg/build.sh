#!/bin/bash
PACKAGE=libogg
VERSION=1.3.0
EXT=tar.xz
BASEURL=http://downloads.xiph.org/releases/ogg

. $(dirname $0)/../functions.sh

STATICLIBS="libogg"

pkg_build && pkg_clean
