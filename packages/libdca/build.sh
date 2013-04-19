#!/bin/bash
PACKAGE=libdca
VERSION=0.0.5
EXT=tar.bz2
BASEURL=http://download.videolan.org/pub/videolan/${PACKAGE}/${VERSION}

. $(dirname $0)/../functions.sh

STATICLIBS="libdca"

pkg_build && pkg_clean
