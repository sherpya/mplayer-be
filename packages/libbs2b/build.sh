#!/bin/bash
# Build script for Bauer stereophonic-to-binaural DSP
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=libbs2b
VERSION=3.1.0
EXT=tar.bz2
BASEURL=http://downloads.sourceforge.net/project/bs2b/${PACKAGE}/${VERSION}

. $(dirname $0)/../functions.sh

STATICLIBS="libbs2b"

# not cross build friendly
export ac_cv_func_malloc_0_nonnull=yes

pkg_build && pkg_clean
