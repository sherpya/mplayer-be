#!/bin/bash
# Build script for libmad
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

# includes fixes for:
# CVE-2017-8372, CVE-2017-8373: 01_debian_md-size.diff
# CVE-2017-8374: 02_debian_length-check.diff
# 

PACKAGE=libmad
VERSION=0.15.1b
EXT=tar.gz
BASEURL=http://downloads.sourceforge.net/project/mad/${PACKAGE}/${VERSION}

. $(dirname $0)/../functions.sh

STATICLIBS="libmad"

pkg_build && pkg_clean
