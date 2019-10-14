#!/bin/bash
# Build script for TwoLAME - MPEG Audio Layer 2 Encoder
# Copyright (c) 2013-2019 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=twolame
VERSION=0.4.0
EXT=tar.gz
BASEURL=http://downloads.sourceforge.net/project/${PACKAGE}/${PACKAGE}/${VERSION}

. $(dirname $0)/../functions.sh

STATICLIBS="libtwolame"

pkg_build && pkg_clean
