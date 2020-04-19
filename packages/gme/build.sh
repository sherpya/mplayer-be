#!/bin/bash
# Build script for game-music-emu
# Copyright (c) 2014-2020 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=game-music-emu
VERSION=0.6.3
EXT=tar.xz
BASEURL=https://bitbucket.org/mpyne/${PACKAGE}/downloads

. $(dirname $0)/../functions.sh

CMAKE=1
CMAKEOPTS="-DENABLE_UBSAN:bool=off"

pkg_build && pkg_clean
