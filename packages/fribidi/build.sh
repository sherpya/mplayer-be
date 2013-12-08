#!/bin/bash
# Build script for GNU FriBidi
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=fribidi
VERSION=0.19.6
EXT=tar.bz2
BASEURL=http://fribidi.org/download

. $(dirname $0)/../functions.sh

STATICLIBS="libfribidi"

pkg_build && pkg_clean
