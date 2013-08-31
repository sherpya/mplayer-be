#!/bin/bash
# Build script for giflib
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=giflib
VERSION=5.0.5
EXT=tar.bz2
BASEURL=http://downloads.sourceforge.net/project/${PACKAGE}/${PACKAGE}-5.x

. $(dirname $0)/../functions.sh

STATICLIBS="libgif"

pkg_build && pkg_clean
