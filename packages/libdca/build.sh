#!/bin/sh
PACKAGE=libdca
VERSION=0.0.5
EXT=tar.bz2
BASEURL=http://download.videolan.org/pub/videolan/libdca/0.0.5

. $(dirname $0)/../functions.sh

pkg_build && pkg_clean
