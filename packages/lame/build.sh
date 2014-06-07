#!/bin/bash
# Build script for LAME MP3 Encoder
# Copyright (c) 2013-2014 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=lame
VERSION=3.99.5
EXT=tar.gz
BASEURL=http://downloads.sourceforge.net/project/${PACKAGE}/${PACKAGE}/${VERSION%.*}

. $(dirname $0)/../functions.sh

STATICLIBS="libmp3lame"
CONFOPTS="--disable-decoder --disable-frontend"

export alex_cv_ieee854_float80=yes

pkg_build && pkg_clean
