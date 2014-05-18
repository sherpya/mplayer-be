#!/bin/bash
# Build script for Libcaca graphics library
# Copyright (c) 2013-2014 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=libcaca
VERSION=0.99.beta19
EXT=tar.gz
BASEURL=http://caca.zoy.org/files/${PACKAGE}

. $(dirname $0)/../functions.sh

depends lib/libz.a

STATICLIBS="libcaca libcaca++ libcucul libcucul++"
CONFOPTS="--enable-python=no --enable-ruby=no --enable-java=no"

pkg_build && pkg_clean
