#!/bin/bash
# Build script for Gmerlin Audio Video Library
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=gavl
VERSION=1.4.0
EXT=tar.gz
BASEURL=http://downloads.sourceforge.net/project/gmerlin/${PACKAGE}/${VERSION}
MARCH=i686

. $(dirname $0)/../functions.sh

STATICLIBS="libgavl"
CONFOPTS="--with-cpuflags=none --without-doxygen"

# 32bit Linux / 32-64 Bit Windows 1/0
# 64bit Linux 0/0
export ac_cv_c_clip_negative=1
export ac_cv_c_clip_positive=0
export ac_cv_c_clip_type=negative

pkg_build && pkg_clean
