#!/bin/bash
# Build script for libwebp
# Copyright (c) 2014 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=libwebp
VERSION=0.4.0
EXT=tar.gz
BASEURL=https://webp.googlecode.com/files

. $(dirname $0)/../functions.sh

STATICLIBS="libwebp"
CONFOPTS="--disable-wic"

# only for tools
export ac_cv_header_png_h=no
export ac_cv_header_jpeglib_h=no
export ac_cv_header_tiffio_h=no
export ac_cv_header_gif_lib_h=no

pkg_build && pkg_clean
