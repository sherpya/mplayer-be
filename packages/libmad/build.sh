#!/bin/bash
# Build script for libmad
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=libmad
VERSION=0.15.1b
EXT=tar.gz
BASEURL=http://downloads.sourceforge.net/project/mad/${PACKAGE}/${VERSION}

. $(dirname $0)/../functions.sh

STATICLIBS="libmad"

pkg_build && pkg_clean
