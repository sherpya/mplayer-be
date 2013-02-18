#!/bin/sh
tool=$(dirname $0)/mp.sh

$tool build_source

HOST=x86_64-w64-mingw32 $tool build_binary x86_64

$tool build_binary core2
$tool build_binary corei7
$tool build_binary k8-sse3
$tool build_binary bdver1
$tool build_binary generic
