#!/bin/bash
# Build script for The Fraunhofer FDK AAC Codec Library for Android
# Copyright (c) 2014 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO="git://github.com/mstorsjo/fdk-aac.git"

. $(dirname $0)/../functions.sh

BUILDDIR=fdk-aac

pkg_configure()
{
    : # disabled
}

HEADERS="libAACdec/include/aacdecoder_lib.h \
    libAACenc/include/aacenc_lib.h \
    libSYS/include/FDK_audio.h \
    libSYS/include/genericStds.h \
    libSYS/include/machine_type.h"

pkg_make_target()
{
    echo "Installing headers"
    install -d -m755 ${PREFIX}/include/fdk-aac
    for header in $HEADERS; do
        install -m644 $header ${PREFIX}/include/fdk-aac
    done
}

pkg_build
