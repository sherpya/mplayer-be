#!/bin/sh
PACKAGE=flac
VERSION=1.2.1
EXT=tar.gz
BASEURL=http://downloads.xiph.org/releases/flac

. $(dirname $0)/../functions.sh

CONFOPTS="--mandir=${PREFIX}/share/man"

depends lib/libogg.a

pkg_build && pkg_clean

install -m644 files/libFLAC.la ${PREFIX}/lib/libFLAC.la
