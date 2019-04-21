#!/bin/bash
# Build script for mingw-std-threads
# Copyright (c) 2019 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO=https://github.com/meganz/mingw-std-threads.git

. $(dirname $0)/../functions.sh

BUILDDIR="mingw-std-threads"

pkg_make_target()
{
    for header in *.h; do
        cmd install -m644 ${header}  ${PREFIX}/include/${header}
    done
}

git_clean && pkg_build && git_clean
