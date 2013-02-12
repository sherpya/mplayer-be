#!/bin/sh
PACKAGE=lame
VERSION=3.99.5
EXT=tar.gz
BASEURL=http://downloads.sourceforge.net/project/lame/lame/3.99

. $(dirname $0)/../functions.sh

STATICLIBS="libmp3lame"

pkg_build && pkg_clean
