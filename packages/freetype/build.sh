#!/bin/bash
# Build script for FreeType library
# Copyright (c) 2013-2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

# 2.8 includes fixes for:
# CVE-2017-8105 CVE-2017-8287 CVE-2017-7864 CVE-2017-7857
# CVE-2017-7858

# 2.7.1 includes fixes for:
# CVE-2016-10244

# 2.6.1 includes fixes for:
# CVE-2014-9745 CVE-2014-9746 CVE-2014-9747

# 2.6 includes fixes for:
# CVE-2014-2240 CVE-2014-2241
# CVE-2014-9656 CVE-2014-9657 CVE-2014-9658 CVE-2014-9659
# CVE-2014-9660 CVE-2014-9661 CVE-2014-9662 CVE-2014-9663
# CVE-2014-9664 CVE-2014-9665 CVE-2014-9666 CVE-2014-9667
# CVE-2014-9668 CVE-2014-9669 CVE-2014-9670 CVE-2014-9671
# CVE-2014-9672 CVE-2014-9673 CVE-2014-9674 CVE-2014-9675

PACKAGE=freetype
VERSION=2.9
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
