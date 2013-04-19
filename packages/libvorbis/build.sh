#!/bin/bash
PACKAGE=libvorbis
VERSION=1.3.3
EXT=tar.xz
BASEURL=http://downloads.xiph.org/releases/vorbis

. $(dirname $0)/../functions.sh

depends lib/libogg.a

STATICLIBS="libvorbis libvorbisenc libvorbisfile"

pkg_build && pkg_clean
