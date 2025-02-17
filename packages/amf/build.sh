#!/bin/bash
# Build script for Advanced Media Framework (AMF) SDK
# Copyright (c) 2025 Gianluigi Tiesi <sherpya@gmail.com>
# See LICENSE for licensing informations

GIT_REPO=https://github.com/GPUOpen-LibrariesAndSDKs/AMF.git

. $(dirname $0)/../functions.sh

BUILDDIR="AMF"
CMAKE=1

git_clean && pkg_build && git_clean
