#!/bin/sh
PACKAGE=libiconv
VERSION=1.14
EXT=tar.gz
BASEURL=http://ftp.gnu.org/pub/gnu/libiconv

. $(dirname $0)/../functions.sh

pkg_build && pkg_clean
