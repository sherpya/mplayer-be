#!/bin/bash
# Build script for frei0r plugins
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

GIT_REPO="git://code.dyne.org/frei0r.git"

CMAKE=1
CMAKEOPTS="-DCMAKE_MODULE_LINKER_FLAGS=-s"

. $(dirname $0)/../functions.sh

depends lib/libgavl.a

BUILDDIR=frei0r

git_clean && pkg_build && git_clean

# LIBDIR becames the binary package
LIBDIR=${PREFIX}/lib/frei0r-1

chmod 644 ${LIBDIR}/*.dll
for sharedlib in libstdc++-6.dll libgcc_s_sjlj-1.dll libgcc_s_seh-1.dll; do
    dll=$(print_file_name $sharedlib)
    test -e ${dll} || continue
    install -v -m644 ${dll} ${LIBDIR}/${sharedlib}
    ${CROSS_PREFIX}strip ${LIBDIR}/${sharedlib}
done

for doc in AUTHORS ChangeLog COPYING README; do
    unix2dos -n ${BUILDDIR}/$doc ${LIBDIR}/$doc.txt
done
