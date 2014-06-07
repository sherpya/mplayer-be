#!/bin/bash
# Build script for Theora Video Codec
# Copyright (c) 2013-2014 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=libtheora
VERSION=1.2.0alpha1
EXT=tar.xz
BASEURL=http://downloads.xiph.org/releases/theora

. $(dirname $0)/../functions.sh

depends lib/libogg.a
depends lib/libvorbis.a
depends lib/libpng.a

STATICLIBS="libtheora libtheoraenc libtheoradec"
CONFOPTS="--disable-examples --disable-oggtest --disable-vorbistest" 

pkg_build && pkg_clean
