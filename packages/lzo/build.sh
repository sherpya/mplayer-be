#!/bin/bash
PACKAGE=lzo
VERSION=2.06
EXT=tar.gz
BASEURL=http://www.oberhumer.com/opensource/lzo/download

. $(dirname $0)/../functions.sh

STATICLIBS="liblzo2"

pkg_build && pkg_clean
