#!/bin/bash
PACKAGE=flac
VERSION=1.2.1
EXT=tar.gz
BASEURL=http://downloads.xiph.org/releases/${PACKAGE}

. $(dirname $0)/../functions.sh

depends lib/libogg.a

STATICLIBS="libFLAC libFLAC++"

pkg_build && pkg_clean
