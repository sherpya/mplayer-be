#!/bin/bash
# Build script for libxml2
# Copyright (c) 2014-2016 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

# includes fixes for: CVE-2014-3660 (2.9.3)

PACKAGE=libxml2
VERSION=2.9.4
EXT=tar.gz
BASEURL=ftp://xmlsoft.org/libxml2/

. $(dirname $0)/../functions.sh

depends lib/libz.a
depends lib/libiconv.a

STATICLIBS="libxml2"
CONFOPTS="--with-python=no --with-http=no --with-ftp=no"

pkg_build && pkg_clean
