#!/bin/bash
# Build script for VisualOn AMR-WB Encoder
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=vo-amrwbenc
VERSION=0.1.3
EXT=tar.gz
BASEURL=http://downloads.sourceforge.net/project/opencore-amr/${PACKAGE}

. $(dirname $0)/../functions.sh

STATICLIBS="libvo-amrwbenc"

pkg_build && pkg_clean
