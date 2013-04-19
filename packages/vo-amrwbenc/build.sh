#!/bin/bash
PACKAGE=vo-amrwbenc
VERSION=0.1.2
EXT=tar.gz
BASEURL=http://downloads.sourceforge.net/project/opencore-amr/${PACKAGE}

. $(dirname $0)/../functions.sh

STATICLIBS="libvo-amrwbenc"

pkg_build && pkg_clean
