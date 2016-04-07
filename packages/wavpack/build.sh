#!/bin/bash
# Build script for WavPack
# Copyright (c) 2014-2016 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=wavpack
VERSION=4.80.0
EXT=tar.bz2
BASEURL=http://wavpack.com

. $(dirname $0)/../functions.sh

STATICLIBS="libwavpack"

pkg_build && pkg_clean
