#!/bin/bash
# Build script for Expat XML Parser
# Copyright (c) 2013-2022 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=expat
VERSION=2.4.8
EXT=tar.bz2
BASEURL=http://downloads.sourceforge.net/project/${PACKAGE}/${PACKAGE}/${VERSION}

. $(dirname $0)/../functions.sh

STATICLIBS="libexpat"
CONFOPTS="--without-docbook"

pkg_make_target()
{
    make -C lib ${MAKEOPTS} install
}

pkg_build && pkg_clean
