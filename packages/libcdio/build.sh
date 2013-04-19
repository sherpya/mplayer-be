#!/bin/bash
PACKAGE=libcdio
VERSION=0.90
EXT=tar.gz
BASEURL=http://ftp.gnu.org/gnu/${PACKAGE}

. $(dirname $0)/../functions.sh

depends lib/libcddb.a

STATICLIBS="libcdio libcdio++ libiso9660 libiso9660++ libudf"

pkg_build && pkg_clean
