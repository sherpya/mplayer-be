#!/bin/bash
# Build script for giflib
# Copyright (c) 2013-2014 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

# includes fixes for: CVE-2005-2974, CVE-2005-3350

PACKAGE=giflib
VERSION=5.1.0
EXT=tar.bz2
BASEURL=http://downloads.sourceforge.net/project/${PACKAGE}

. $(dirname $0)/../functions.sh

STATICLIBS="libgif"

pkg_build && pkg_clean
