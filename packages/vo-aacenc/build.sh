#!/bin/sh
PACKAGE=vo-aacenc
VERSION=0.1.2
EXT=tar.gz
BASEURL=http://downloads.sourceforge.net/project/opencore-amr/${PACKAGE}

. $(dirname $0)/../functions.sh

STATICLIBS="libvo-aacenc"

pkg_build && pkg_clean
