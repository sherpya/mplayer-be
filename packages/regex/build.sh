#!/bin/bash
# Build script for GNU regex
# Copyright (c) 2013-2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=regex
VERSION=0.12
EXT=tar.gz
BASEURL=http://ftp.gnu.org/old-gnu/${PACKAGE}

. $(dirname $0)/../functions.sh

CMAKE=1

pkg_build && pkg_clean
