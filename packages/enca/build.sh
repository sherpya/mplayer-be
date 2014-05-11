#!/bin/bash
# Build script for ENCA - Extremely Naive Charset Analyser
# Copyright (c) 2013-2014 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=enca
VERSION=1.15
EXT=tar.bz2
BASEURL=http://dl.cihar.com/${PACKAGE}

. $(dirname $0)/../functions.sh

depends lib/libiconv.a

STATICLIBS="libenca"

# not cross build friendly
export ac_cv_file__dev_random=false
export ac_cv_file__dev_urandom=false
export ac_cv_file__dev_srandom=false
export ac_cv_file__dev_arandom=false

pkg_make_target()
{
    # host compiler
    gcc -DHAVE_MEMORY_H tools/make_hash.c -O2 -o tools/make_hash
    make ${MAKEOPTS} install
}

pkg_build && pkg_clean
