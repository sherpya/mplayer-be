#!/bin/bash
# Build script for Cisco's Open Source H.264 Codec
# Copyright (c) 2018-2021 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO=https://github.com/cisco/openh264.git

__USE_MINGW_ANSI_STDIO=1

. $(dirname $0)/../functions.sh

BUILDDIR=openh264
CMAKE=1

git_clean && pkg_build && git_clean
