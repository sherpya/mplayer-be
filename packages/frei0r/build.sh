#!/bin/sh

. $(dirname $0)/../functions.sh

depends lib/libgavl.a

BUILDDIR=frei0r
GIT_REPO="git://code.dyne.org/frei0r.git"
CMAKE=1
CMAKEOPTS="-DCMAKE_MODULE_LINKER_FLAGS=-s"

git_clean && pkg_build && git_clean

# LIBDIR becames the binary package
LIBDIR=${PREFIX}/lib/frei0r-1

chmod 644 ${LIBDIR}/*.dll
for sharedlib in libgcc_s_sjlj-1.dll libstdc++-6.dll; do
    install -v -m644 $(print_file_name $sharedlib) ${LIBDIR}/$sharedlib
    ${CROSS_PREFIX}strip ${LIBDIR}/$sharedlib
done

for doc in AUTHORS ChangeLog COPYING README; do
    unix2dos -n ${BUILDDIR}/$doc ${LIBDIR}/$doc.txt
done
