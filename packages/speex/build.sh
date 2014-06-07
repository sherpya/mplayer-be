#!/bin/bash
# Build script for Speex Audio Codec
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=speex
VERSION=1.2rc1
EXT=tar.gz
BASEURL=http://downloads.xiph.org/releases/${PACKAGE}

. $(dirname $0)/../functions.sh

depends lib/libogg.a

STATICLIBS="libspeex libspeexdsp"
CONFOPTS="--disable-oggtest"

pkg_build && pkg_clean
