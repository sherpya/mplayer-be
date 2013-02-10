#!/bin/sh
PACKAGE=twolame
VERSION=0.3.13
EXT=tar.gz
BASEURL=http://downloads.sourceforge.net/project/twolame/twolame/0.3.13

. $(dirname $0)/../functions.sh

pkg_build && pkg_clean
