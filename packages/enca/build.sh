#!/bin/sh
PACKAGE=enca
VERSION=1.14
EXT=tar.bz2
BASEURL=http://dl.cihar.com/enca

. $(dirname $0)/../functions.sh

depends lib/libiconv.a

STATICLIBS="libenca"

export ac_cv_file__dev_random=false
export ac_cv_file__dev_urandom=false
export ac_cv_file__dev_srandom=false
export ac_cv_file__dev_arandom=false

pre_make_hook()
{
    ( cd ${BUILDDIR}/tools && gcc -o make_hash make_hash.c )
}

pkg_build && pkg_clean
