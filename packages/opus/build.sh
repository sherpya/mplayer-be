#!/bin/sh
PACKAGE=opus
VERSION=1.0.2
EXT=tar.gz
BASEURL=http://downloads.xiph.org/releases/opus

. $(dirname $0)/../functions.sh

STATICLIBS="libopus"

pkg_build && pkg_clean
