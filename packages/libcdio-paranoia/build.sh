#!/bin/sh
PACKAGE=libcdio-paranoia
VERSION=10.2+0.90
EXT=tar.bz2
BASEURL=http://ftp.gnu.org/gnu/libcdio

. $(dirname $0)/../functions.sh

STATICLIBS="libcdio_cdda libcdio_paranoia"

pkg_build && pkg_clean
