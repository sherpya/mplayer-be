#!/bin/bash
# Build script for ModPlug library
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO=https://github.com/Konstanty/libmodplug.git

. $(dirname $0)/../functions.sh

BUILDDIR="libmodplug"
STATICLIBS="libmodplug"

git_clean && pkg_build && git_clean
