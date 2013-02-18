#!/bin/sh
PACKAGE=libmodplug
VERSION=0.8.8.4
EXT=tar.gz
BASEURL=http://downloads.sourceforge.net/project/modplug-xmms/libmodplug/0.8.8.4

. $(dirname $0)/../functions.sh

STATICLIBS="libmodplug"

pkg_build && pkg_clean
