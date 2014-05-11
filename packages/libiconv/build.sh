#!/bin/bash
# Build script for GNU libiconv
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=libiconv
VERSION=1.14
EXT=tar.gz
BASEURL=http://ftp.gnu.org/pub/gnu/${PACKAGE}

. $(dirname $0)/../functions.sh

STATICLIBS="libiconv"
CONFOPTS="--disable-nls"

pkg_make_target()
{
    make ${MAKEOPTS} install-lib
}

pkg_build && pkg_clean
