#!/bin/sh
PACKAGE=enca
VERSION=1.14
EXT=tar.bz2
BASEURL=http://dl.cihar.com/enca

. $(dirname $0)/../functions.sh

depends lib/libiconv.a

STATICLIBS="libenca"

pkg_build && pkg_clean
