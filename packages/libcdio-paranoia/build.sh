#!/bin/bash
PACKAGE=libcdio-paranoia
VERSION=10.2+0.90
EXT=tar.bz2
BASEURL=http://ftp.gnu.org/gnu/libcdio

. $(dirname $0)/../functions.sh

depends lib/libcdio.a

STATICLIBS="libcdio_cdda libcdio_paranoia"

pkg_make_target()
{
    make ${MAKEOPTS} install
    # fix broken include path
    sed -i -e 's,cdio/paranoia/cdda\.h,cdio/cdda\.h,g' ${PREFIX}/include/cdio/paranoia.h
}

pkg_build && pkg_clean
