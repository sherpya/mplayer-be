#!/bin/bash
# Build script for giflib
# Copyright (c) 2013-2019 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

# 5.1.1 includes fixes for: CVE-2005-2974, CVE-2005-3350

PACKAGE=giflib
VERSION=5.2.1
EXT=tar.gz
BASEURL=http://downloads.sourceforge.net/project/${PACKAGE}

. $(dirname $0)/../functions.sh

CMAKE=1

pkg_build && pkg_clean
