#!/bin/bash
# Build script for GSM speech compressor
# Copyright (c) 2013-2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=gsm
VERSION=1.0-pl13
EXT=tar.xz
BASEURL=local

. $(dirname $0)/../functions.sh

CMAKE=1

pkg_build && pkg_clean
