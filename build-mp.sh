#!/bin/bash
# MPlayer/FFmpeg MinGW-w64 Cross Build Environment
# Copyright (c) 2013-2014 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

grep -q enabled /proc/sys/fs/binfmt_misc/status 2>/dev/null && \
 { echo "binfmt support is enabled, aborting"; exit 1; }

tool=$(dirname $0)/mp.sh

$tool build_source

HOST=x86_64-w64-mingw32 $tool build_binary x86_64

$tool build_binary core2
$tool build_binary corei7
$tool build_binary k8-sse3
#$tool build_binary bdver1
$tool build_binary generic
