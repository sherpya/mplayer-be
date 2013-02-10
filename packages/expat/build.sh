#!/bin/sh
PACKAGE=expat
VERSION=2.1.0
EXT=tar.gz
BASEURL=http://downloads.sourceforge.net/project/expat/expat/2.1.0

. $(dirname $0)/../functions.sh

pkg_build && pkg_clean
