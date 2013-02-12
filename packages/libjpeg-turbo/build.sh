#!/bin/sh
PACKAGE=libjpeg-turbo
VERSION=1.2.1
EXT=tar.gz
BASEURL=http://downloads.sourceforge.net/project/libjpeg-turbo/1.2.1

. $(dirname $0)/../functions.sh

CONFOPTS="--mandir=${PREFIX}/share/man"

STATICLIBS="libjpeg libturbojpeg"

pkg_build && pkg_clean
