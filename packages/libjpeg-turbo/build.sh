#!/bin/bash
PACKAGE=libjpeg-turbo
VERSION=1.2.1
EXT=tar.gz
BASEURL=http://downloads.sourceforge.net/project/${PACKAGE}/${VERSION}

. $(dirname $0)/../functions.sh

STATICLIBS="libjpeg libturbojpeg"
CONFOPTS="--mandir=${PREFIX}/share/man"

pkg_build && pkg_clean
