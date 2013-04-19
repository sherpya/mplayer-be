#!/bin/bash
PACKAGE=opencore-amr
VERSION=0.1.3
EXT=tar.gz
BASEURL=http://downloads.sourceforge.net/project/${PACKAGE}/${PACKAGE}

. $(dirname $0)/../functions.sh

STATICLIBS="libopencore-amrnb libopencore-amrwb"

pkg_build && pkg_clean
