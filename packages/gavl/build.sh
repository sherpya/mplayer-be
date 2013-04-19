#!/bin/bash
# Build script for Gmerlin Audio Video Library
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=gavl
VERSION=1.4.0
EXT=tar.gz
BASEURL=http://downloads.sourceforge.net/project/gmerlin/${PACKAGE}/${VERSION}

. $(dirname $0)/../functions.sh

STATICLIBS="libgavl"
CONFOPTS="--with-cpuflags=none --without-doxygen"

pkg_build && pkg_clean
