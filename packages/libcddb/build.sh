#!/bin/bash
# Build script for CDDB server access library (libcddb)
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=libcddb
VERSION=1.3.2
EXT=tar.bz2
BASEURL=http://downloads.sourceforge.net/project/${PACKAGE}/${PACKAGE}/${VERSION}

. $(dirname $0)/../functions.sh

depends lib/libregex.a

STATICLIBS="libcddb"
CONFOPTS="--without-cdio"

export ac_cv_func_alarm=false

pkg_build && pkg_clean
