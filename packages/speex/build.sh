#!/bin/bash
PACKAGE=speex
VERSION=1.2rc1
EXT=tar.gz
BASEURL=http://downloads.xiph.org/releases/${PACKAGE}

. $(dirname $0)/../functions.sh

depends lib/libogg.a

STATICLIBS="libspeex libspeexdsp"

pkg_build && pkg_clean
