#!/bin/bash
# Build script for Expat XML Parser
# Copyright (c) 2013-2016 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=expat
VERSION=2.1.1
EXT=tar.bz2
BASEURL=http://downloads.sourceforge.net/project/${PACKAGE}/${PACKAGE}/${VERSION}

. $(dirname $0)/../functions.sh

STATICLIBS="libexpat"

pkg_make_target()
{
    make ${MAKEOPTS} installlib
}

pkg_build && pkg_clean
