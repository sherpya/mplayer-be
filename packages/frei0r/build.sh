#!/bin/sh

. $(dirname $0)/../functions.sh

depends lib/libgavl.a

BUILDDIR=frei0r
GIT_REPO="git://code.dyne.org/frei0r.git"

git_clean && pkg_build && git_clean
