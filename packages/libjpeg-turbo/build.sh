#!/bin/bash
# Build script for libjpeg-turbo
# Copyright (c) 2013-2016 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

# includes fixes for: CVE-2013-6629, CVE-2013-6630

PACKAGE=libjpeg-turbo
VERSION=1.5.0
EXT=tar.gz
BASEURL=http://downloads.sourceforge.net/project/${PACKAGE}/${VERSION}

. $(dirname $0)/../functions.sh

STATICLIBS="libjpeg libturbojpeg"

pkg_build && pkg_clean
