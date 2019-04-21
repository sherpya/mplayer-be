#!/bin/bash
# Build script for GNU GMP library
# Copyright (c) 2015-2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=gmp
VERSION=6.1.2
EXT=tar.xz
BASEURL=https://gmplib.org/download/${PACKAGE}

. $(dirname $0)/../functions.sh

# force i486 instruction set
[ "${ARCH}" = "x86" ] && export MPN_PATH="x86/i486 x86 generic"

STATICLIBS="libgmp"
FORCE_AUTOGEN=1

pkg_build && pkg_clean
