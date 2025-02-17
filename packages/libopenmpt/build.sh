#!/bin/bash
# Build script for OpenMPT library
# Copyright (c) 2018-2025 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=libopenmpt
VERSION=0.7.13+release.autotools
EXT=tar.gz
BASEURL=https://lib.openmpt.org/files/libopenmpt/src

. $(dirname $0)/../functions.sh

depends lib/libz.a
depends include/mingw.thread.h

STATICLIBS="libopenmpt"
CONFOPTS="--disable-openmpt123 --disable-examples --disable-tests \
          --without-mpg123 --without-ogg --without-vorbis --without-vorbisfile \
          --without-portaudio --without-portaudiocpp --without-sndfile --without-flac"

[ "${ARCH}" = "x86" ] && add_to_flags "-DWINVER=_WIN32_WINNT_WINXP"

pkg_build && pkg_clean
