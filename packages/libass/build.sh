#!/bin/bash
PACKAGE=libass
VERSION=0.10.1
EXT=tar.xz
BASEURL=http://libass.googlecode.com/files

. $(dirname $0)/../functions.sh

depends lib/libfreetype.a
depends lib/libfribidi.a
depends lib/libfontconfig.a
depends lib/libenca.a

STATICLIBS="libass"

pkg_build && pkg_clean
