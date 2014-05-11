#!/bin/bash
# Build script for libjpeg-turbo
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

PACKAGE=libjpeg-turbo
VERSION=1.3.1
EXT=tar.gz
BASEURL=http://downloads.sourceforge.net/project/${PACKAGE}/${VERSION}

. $(dirname $0)/../functions.sh

STATICLIBS="libjpeg libturbojpeg"

pkg_build && pkg_clean
