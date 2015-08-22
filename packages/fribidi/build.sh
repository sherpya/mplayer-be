#!/bin/bash
# Build script for GNU FriBidi
# Copyright (c) 2013-2015 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=fribidi
VERSION=0.19.7
EXT=tar.bz2
BASEURL=http://fribidi.org/download

. $(dirname $0)/../functions.sh

STATICLIBS="libfribidi"
CONFOPTS="--with-glib=no"

pkg_build && pkg_clean
