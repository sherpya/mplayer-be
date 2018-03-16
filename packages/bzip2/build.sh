#!/bin/bash
# Build script for bzip2 data compressor
# Copyright (c) 2013-2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=bzip2
VERSION=1.0.6
EXT=tar.gz
BASEURL=http://www.bzip.org/${VERSION}

. $(dirname $0)/../functions.sh

CMAKE=1

pkg_build && pkg_clean
