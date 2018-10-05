#!/bin/bash
# Build script for OpenMPT library
# Copyright (c) 2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=libopenmpt
VERSION=0.3.12+release.autotools
EXT=tar.gz
BASEURL=https://lib.openmpt.org/files/libopenmpt/src

. $(dirname $0)/../functions.sh

depends lib/libz.a

STATICLIBS="libopenmpt"
CONFOPTS="--disable-openmpt123 --disable-examples --disable-tests \
          --without-mpg123 --without-ogg --without-vorbis --without-vorbisfile \
          --without-portaudio --without-portaudiocpp --without-sndfile --without-flac"

pkg_build && pkg_clean
