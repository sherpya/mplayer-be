#!/bin/bash
# Build script for OGG Open Container Format
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=libogg
VERSION=1.3.1
EXT=tar.xz
BASEURL=http://downloads.xiph.org/releases/ogg

. $(dirname $0)/../functions.sh

STATICLIBS="libogg"

pkg_build && pkg_clean
