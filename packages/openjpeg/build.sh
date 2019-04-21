#!/bin/bash
# Build script for OpenJPEG - JPEG 2000 codec library
# Copyright (c) 2013-2019 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=openjpeg
VERSION=2.3.1
EXT=tar.gz
BASEURL=https://github.com/uclouvain/${PACKAGE}/archive

CMAKE=1
CMAKEOPTS=" \
    -DOPENJPEG_INSTALL_INCLUDE_DIR=include  \
    -DBUILD_PKGCONFIG_FILES=ON              \
    -DBUILD_SHARED_LIBS=OFF                 \
    -DBUILD_CODEC=OFF"

. $(dirname $0)/../functions.sh

FILENAME="v${VERSION}.${EXT}"

pkg_build && pkg_clean
