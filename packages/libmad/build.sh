#!/bin/sh
PACKAGE=libmad
VERSION=0.15.1b
EXT=tar.gz
BASEURL=http://downloads.sourceforge.net/project/mad/libmad/0.15.1b

. $(dirname $0)/../functions.sh

pkg_build && pkg_clean
