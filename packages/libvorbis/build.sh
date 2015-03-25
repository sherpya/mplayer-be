#!/bin/bash
# Build script for Ogg Vorbis Audio Codec
# Copyright (c) 2013-2015 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

# includes fixes for: CVE-2012-0444

PACKAGE=libvorbis
VERSION=1.3.5
EXT=tar.xz
BASEURL=http://downloads.xiph.org/releases/vorbis

. $(dirname $0)/../functions.sh

depends lib/libogg.a

STATICLIBS="libvorbis libvorbisenc libvorbisfile"

pkg_build && pkg_clean
