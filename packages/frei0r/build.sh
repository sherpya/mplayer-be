#!/bin/sh

. $(dirname $0)/../functions.sh

depends lib/libgavl.a

BUILDDIR=frei0r
GIT_REPO="git://code.dyne.org/frei0r.git"
CMAKE=1

git_clean && pkg_build && git_clean

LIBDIR=${PREFIX}/lib/frei0r-1

for sharedlib in libgcc_s_sjlj-1.dll libstdc++-6.dll; do
    install -v -m644 $(print_file_name $sharedlib) ${LIBDIR}/$sharedlib
done
