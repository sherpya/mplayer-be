#!/bin/sh
PACKAGE=libcaca
VERSION=0.99.beta18
EXT=tar.gz
BASEURL=http://caca.zoy.org/files/libcaca

CONFOPTS="--enable-python=no --enable-ruby=no --enable-java=no"

. $(dirname $0)/../functions.sh

depends lib/libz.a

pkg_build && pkg_clean

install -m755 files/caca-config ${PREFIX}/bin/caca-config
