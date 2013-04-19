#!/bin/bash
# MPlayer/FFmpeg MinGW-w64 Cross Build Environment
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

tool=$(dirname $0)/ff.sh

HOST=x86_64-w64-mingw32 $tool build_binary
$tool build_binary
$tool build_source
