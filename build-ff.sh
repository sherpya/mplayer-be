#!/bin/sh
tool=$(dirname $0)/ff.sh

HOST=x86_64-w64-mingw32 $tool build_binary
$tool build_binary
$tool build_source
