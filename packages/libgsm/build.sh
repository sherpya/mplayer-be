#!/bin/bash
# Build script for GSM speech compressor
# Copyright (c) 2013-2022 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=gsm
VERSION=1.0.19
EXT=tar.gz
BASEURL=http://www.quut.com/gsm

. $(dirname $0)/../functions.sh

CMAKE=1
BUILDDIR="gsm-1.0-pl19"

pkg_build && pkg_clean
