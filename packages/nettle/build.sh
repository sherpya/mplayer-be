#!/bin/bash
# Build script for Nettle library
# Copyright (c) 2015-2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=nettle
VERSION=3.4
EXT=tar.gz
BASEURL=https://ftp.gnu.org/gnu/nettle

. $(dirname $0)/../functions.sh

STATICLIBS="libnettle libhogweed"
CONFOPTS="--disable-documentation --disable-openssl"

pkg_build && pkg_clean
