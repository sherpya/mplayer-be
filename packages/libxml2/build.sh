#!/bin/bash
# Build script for libxml2
# Copyright (c) 2014 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=libxml2
VERSION=2.9.1
EXT=tar.gz
BASEURL=ftp://xmlsoft.org/libxml2/

. $(dirname $0)/../functions.sh

depends lib/libz.a
depends lib/libiconv.a

STATICLIBS="libxml2"
CONFOPTS="--with-python=no"

pkg_build && pkg_clean
