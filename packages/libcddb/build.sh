#!/bin/bash
PACKAGE=libcddb
VERSION=1.3.2
EXT=tar.bz2
BASEURL=http://downloads.sourceforge.net/project/${PACKAGE}/${PACKAGE}/${VERSION}

. $(dirname $0)/../functions.sh

STATICLIBS="libcddb"

export ac_cv_func_alarm=false
pkg_build && pkg_clean
