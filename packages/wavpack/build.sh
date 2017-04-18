#!/bin/bash
# Build script for WavPack
# Copyright (c) 2014-2017 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=wavpack
VERSION=5.1.0
EXT=tar.bz2
BASEURL=http://wavpack.com

. $(dirname $0)/../functions.sh

STATICLIBS="libwavpack"
CONFOPTS="--disable-apps"

pkg_build && pkg_clean
