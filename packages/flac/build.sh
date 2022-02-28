#!/bin/bash
# Build script for Free Lossless Audio Codec
# Copyright (c) 2013-2022 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

# includes fixes for: CVE-2014-8962, CVE-2014-9028

PACKAGE=flac
VERSION=1.3.4
EXT=tar.xz
BASEURL=http://downloads.xiph.org/releases/${PACKAGE}

__USE_MINGW_ANSI_STDIO=1

. $(dirname $0)/../functions.sh

depends lib/libogg.a

STATICLIBS="libFLAC libFLAC++"
CONFOPTS="--disable-oggtest --disable-xmms-plugin"

pkg_build && pkg_clean
