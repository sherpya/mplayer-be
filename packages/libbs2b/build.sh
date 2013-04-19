#!/bin/bash
PACKAGE=libbs2b
VERSION=3.1.0
EXT=tar.bz2
BASEURL=http://downloads.sourceforge.net/project/bs2b/${PACKAGE}/${VERSION}

. $(dirname $0)/../functions.sh

STATICLIBS="libbs2b"

# not cross build friendly
export ac_cv_func_malloc_0_nonnull=yes
export ac_cv_header_stdc=yes

pkg_build && pkg_clean
