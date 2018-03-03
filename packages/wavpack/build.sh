#!/bin/bash
# Build script for WavPack
# Copyright (c) 2014-2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

# includes patches for:
# CVE-2018-6767 CVE-2018-7253 CVE-2018-7254

PACKAGE=wavpack
VERSION=5.1.0
EXT=tar.bz2
BASEURL=http://wavpack.com

. $(dirname $0)/../functions.sh

STATICLIBS="libwavpack"
CONFOPTS="--disable-apps"

pkg_build && pkg_clean
