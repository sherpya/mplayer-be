#!/bin/bash
# Build script for GNU GMP library
# Copyright (c) 2015 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=gmp
VERSION=6.0.0a
EXT=tar.xz
BASEURL=https://gmplib.org/download/${PACKAGE}

. $(dirname $0)/../functions.sh

BUILDDIR=${PACKAGE}-6.0.0

STATICLIBS="libgmp"

pkg_build && pkg_clean
