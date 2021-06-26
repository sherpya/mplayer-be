#!/bin/bash
# Build script for Cisco's Open Source H.264 Codec
# Copyright (c) 2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO=https://github.com/cisco/openh264.git
MARCH=i686

. $(dirname $0)/../functions.sh

BUILDDIR=openh264

CMAKE=1

# TODO: to be fixed?
MBE_CFLAGS="${MBE_CFLAGS} -Wno-error=format -Wno-error=format-extra-args"
MBE_CXXFLAGS="${MBE_CXXFLAGS} -Wno-error=format -Wno-error=format-extra-args"

post_install_hook()
{
    gen_ld_script libopenh264.a "-lstdc++ -lpthread"
}

git_clean && pkg_build && git_clean
