#!/bin/bash
# Build script for bzip2 data compressor
# Copyright (c) 2013-2019 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=bzip2
VERSION=1.0.8
EXT=tar.gz
BASEURL=https://sourceware.org/pub/bzip2

. $(dirname $0)/../functions.sh

CMAKE=1

pkg_build && pkg_clean
