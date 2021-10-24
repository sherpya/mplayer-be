#!/bin/bash
# Build script for GNU FriBidi
# Copyright (c) 2013-2021 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=fribidi
VERSION=1.0.11
EXT=tar.xz
BASEURL=https://github.com/fribidi/fribidi/releases/download/v${VERSION}

. $(dirname $0)/../functions.sh

STATICLIBS="libfribidi"
CONFOPTS="--disable-docs"

pkg_build && pkg_clean
