#!/bin/bash
# Build script for FreeType library
# Copyright (c) 2013-2015 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

# includes fixes for:
# CVE-2014-2240 CVE-2014-2241
# CVE-2014-9656 CVE-2014-9657 CVE-2014-9658 CVE-2014-9659
# CVE-2014-9660 CVE-2014-9661 CVE-2014-9662 CVE-2014-9663
# CVE-2014-9664 CVE-2014-9665 CVE-2014-9666 CVE-2014-9667
# CVE-2014-9668 CVE-2014-9669 CVE-2014-9670 CVE-2014-9671
# CVE-2014-9672 CVE-2014-9673 CVE-2014-9674 CVE-2014-9675

PACKAGE=freetype
VERSION=2.6
EXT=tar.bz2
BASEURL=http://downloads.sourceforge.net/project/${PACKAGE}/freetype2/${VERSION}

. $(dirname $0)/../functions.sh

depends lib/libz.a
depends lib/libbz2.a
depends lib/libpng.a

STATICLIBS="libfreetype"

export LIBPNG_CFLAGS="$(${PREFIX}/bin/libpng-config --cflags)"
export LIBPNG_LDFLAGS="$(${PREFIX}/bin/libpng-config --ldflags)"

pkg_build && pkg_clean
