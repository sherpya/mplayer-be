#!/bin/sh
PACKAGE=libregif
VERSION=4.1.7
EXT=tar.bz2
BASEURL=local

. $(dirname $0)/../functions.sh

pkg_build && pkg_clean
