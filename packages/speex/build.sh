#!/bin/bash
# Build script for Speex Audio Codec
# Copyright (c) 2013-2022 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=speex
VERSION=1.2.1
EXT=tar.gz
BASEURL=http://downloads.xiph.org/releases/${PACKAGE}

. $(dirname $0)/../functions.sh

STATICLIBS="libspeex"

pkg_build && pkg_clean
