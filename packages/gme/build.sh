#!/bin/bash
# Build script for game-music-emu
# Copyright (c) 2014 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=game-music-emu
VERSION=0.6.0
EXT=tar.bz2
BASEURL=https://${PACKAGE}.googlecode.com/files

CMAKE=1

. $(dirname $0)/../functions.sh

pkg_build && pkg_clean
