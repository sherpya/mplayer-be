#!/bin/sh
PACKAGE=speex
VERSION=1.2rc1
EXT=tar.gz
BASEURL=http://downloads.xiph.org/releases/speex

. $(dirname $0)/../functions.sh

depends lib/libogg.a

pkg_build && pkg_clean
