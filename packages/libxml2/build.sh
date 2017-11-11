#!/bin/bash
# Build script for libxml2
# Copyright (c) 2014-2017 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

# patches for:
# CVE-2017-7375: 01_debian-prevent-pe.diff

# 2.9.7 includes fixes for:
# CVE-2016-5131 CVE-2017-0663 CVE-2017-5969
# CVE-2017-7376 CVE-2017-9047 CVE-2017-9048

# 2.9.3 includes fixes for:
# CVE-2014-3660

PACKAGE=libxml2
VERSION=2.9.7
EXT=tar.gz
BASEURL=ftp://xmlsoft.org/libxml2/

. $(dirname $0)/../functions.sh

depends lib/libz.a
depends lib/libiconv.a

STATICLIBS="libxml2"
CONFOPTS="--with-python=no --with-http=no --with-ftp=no"

pkg_build && pkg_clean
