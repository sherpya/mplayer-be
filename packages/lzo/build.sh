#!/bin/bash
# Build script for LZO real-time data compression library
# Copyright (c) 2013-2017 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=lzo
VERSION=2.10
EXT=tar.gz
BASEURL=http://www.oberhumer.com/opensource/${PACKAGE}/download

. $(dirname $0)/../functions.sh

STATICLIBS="liblzo2"

pkg_build && pkg_clean
