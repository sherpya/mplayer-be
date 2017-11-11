#!/bin/bash
# Build script for Opus Audio Codec
# Copyright (c) 2013-2017 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=opus
VERSION=1.2.1
EXT=tar.gz
BASEURL=http://downloads.xiph.org/releases/${PACKAGE}

. $(dirname $0)/../functions.sh

STATICLIBS="libopus"
CONFOPTS="--disable-doc --disable-extra-programs"

pkg_build && pkg_clean
