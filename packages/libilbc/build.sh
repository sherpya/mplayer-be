#!/bin/bash
# Build script for Internet Low Bitrate Codec (iLBC) library
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO="git://github.com/dekkers/libilbc.git"

. $(dirname $0)/../functions.sh

BUILDDIR=libilbc
STATICLIBS="libilbc"

distclean && pkg_build && distclean
