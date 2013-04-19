#!/bin/bash
PACKAGE=libmad
VERSION=0.15.1b
EXT=tar.gz
BASEURL=http://downloads.sourceforge.net/project/mad/${PACKAGE}/${VERSION}

. $(dirname $0)/../functions.sh

STATICLIBS="libmad"

pkg_build && pkg_clean
