#!/bin/bash
PACKAGE=fribidi
VERSION=0.19.5
EXT=tar.bz2
BASEURL=http://fribidi.org/download

. $(dirname $0)/../functions.sh

STATICLIBS="libfribidi"

pkg_build && pkg_clean
