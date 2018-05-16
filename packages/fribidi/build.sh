#!/bin/bash
# Build script for GNU FriBidi
# Copyright (c) 2013-2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=fribidi
VERSION=1.0.3
EXT=tar.bz2
BASEURL=https://github.com/fribidi/fribidi/releases/download/v${VERSION}

. $(dirname $0)/../functions.sh

STATICLIBS="libfribidi"
CONFOPTS="--disable-docs"

pkg_build && pkg_clean
