#!/bin/bash
# Build script for GNU Compact Disc Input and Control Library (cdparanoia)
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=libcdio-paranoia
VERSION=10.2+0.90
EXT=tar.bz2
BASEURL=http://ftp.gnu.org/gnu/libcdio

. $(dirname $0)/../functions.sh

depends lib/libcdio.a

STATICLIBS="libcdio_cdda libcdio_paranoia"

post_make_hook()
{
    # fix broken include path
    sed -i -e 's,cdio/paranoia/cdda\.h,cdio/cdda\.h,g' ${PREFIX}/include/cdio/paranoia.h
}

pkg_build && pkg_clean
