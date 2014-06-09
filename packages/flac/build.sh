#!/bin/bash
# Build script for Free Lossless Audio Codec
# Copyright (c) 2013-2014 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=flac
VERSION=1.3.0
EXT=tar.xz
BASEURL=http://downloads.xiph.org/releases/${PACKAGE}

. $(dirname $0)/../functions.sh

depends lib/libogg.a

STATICLIBS="libFLAC libFLAC++"
CONFOPTS="--disable-oggtest --disable-xmms-plugin"

pkg_build && pkg_clean
