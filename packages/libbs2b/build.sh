#!/bin/sh
PACKAGE=libbs2b
VERSION=3.1.0
EXT=tar.bz2
BASEURL=http://downloads.sourceforge.net/project/bs2b/libbs2b/3.1.0

. $(dirname $0)/../functions.sh

STATICLIBS="libbs2b"

pkg_build && pkg_clean
