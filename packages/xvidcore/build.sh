#!/bin/bash
# Build script for XVID Video Codec
# Copyright (c) 2013-2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=xvidcore
VERSION=1.3.5
EXT=tar.gz
BASEURL=https://downloads.xvid.com/downloads

. $(dirname $0)/../functions.sh

BUILDDIR="xvidcore"
CMAKE=1

pkg_build && pkg_clean
