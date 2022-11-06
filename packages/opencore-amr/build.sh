#!/bin/bash
# Build script for OpenCORE AMR-NB and AMR-WB Decoder
# Copyright (c) 2013-2022 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=opencore-amr
VERSION=0.1.6
EXT=tar.gz
BASEURL=http://downloads.sourceforge.net/project/${PACKAGE}/${PACKAGE}

. $(dirname $0)/../functions.sh

STATICLIBS="libopencore-amrnb libopencore-amrwb"

pkg_build && pkg_clean
