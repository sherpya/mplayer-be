#!/bin/bash
PACKAGE=libcaca
VERSION=0.99.beta18
EXT=tar.gz
BASEURL=http://caca.zoy.org/files/libcaca

CONFOPTS="--enable-python=no --enable-ruby=no --enable-java=no"

. $(dirname $0)/../functions.sh

depends lib/libz.a

STATICLIBS="libcaca libcaca++ libcucul libcucul++"

pkg_build && pkg_clean
