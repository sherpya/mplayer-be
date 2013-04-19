#!/bin/bash
# Build script for Expat XML Parser
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=expat
VERSION=2.1.0
EXT=tar.gz
BASEURL=http://downloads.sourceforge.net/project/${PACKAGE}/${PACKAGE}/${VERSION}

. $(dirname $0)/../functions.sh

STATICLIBS="libexpat"

pkg_make_target()
{
    make ${MAKEOPTS} installlib
}

pkg_build && pkg_clean
