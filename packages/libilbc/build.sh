#!/bin/bash
# Build script for Internet Low Bitrate Codec (iLBC) library
# Copyright (c) 2013-2014 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO="git://github.com/dekkers/libilbc.git"

. $(dirname $0)/../functions.sh

BUILDDIR=libilbc
STATICLIBS="libilbc"

pkg_make_target()
{
    make ${MAKEOPTS} install
    # add missing pthread dependency
    sed -i -e "s,dependency_libs='',dependency_libs='-lpthread',g" ${PREFIX}/lib/libilbc.la
}


git_clean && pkg_build && git_clean
