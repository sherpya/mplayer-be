#!/bin/sh
PACKAGE=openjpeg
VERSION=1.5.1
EXT=tar.gz
BASEURL=http://openjpeg.googlecode.com/files

CMAKE=1
CMAKEOPTS=" \
    -DOPENJPEG_INSTALL_INCLUDE_DIR=include  \
    -DBUILD_SHARED_LIBS=0                   \
    -DBUILD_CODEC=0"

. $(dirname $0)/../functions.sh

pkg_build && pkg_clean
