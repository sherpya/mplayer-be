#!/bin/bash
# Build script for LAME MP3 Encoder
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=lame
VERSION=3.99.5
EXT=tar.gz
BASEURL=http://downloads.sourceforge.net/project/${PACKAGE}/${PACKAGE}/${VERSION%.*}

. $(dirname $0)/../functions.sh

STATICLIBS="libmp3lame"
CONFOPTS="--disable-decoder"

pkg_build && pkg_clean
