#!/bin/bash
PACKAGE=libregif
VERSION=4.1.7
EXT=tar.bz2
BASEURL=http://oss.netfarm.it/mplayer/misc

. $(dirname $0)/../functions.sh

STATICLIBS="libgif"

pkg_build && pkg_clean
