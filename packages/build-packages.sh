#!/bin/bash
# MPlayer/FFmpeg MinGW-w64 Cross Build Environment
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

LOG=/tmp/build-$$.log
echo "Logging to $LOG"
while read package; do
    pushd $package >> $LOG

    echo -n "Building $package..."
    ./build.sh >> $LOG 2>&1

    if [ $? -gt 0 ]; then
         echo "failed"
         exit 1
    fi
    echo "ok"

    popd > /dev/null
done << EOF
winpthreads
dlfcn-win32
zlib
bzip2
libiconv
enca
expat
faac
libpng
freetype
fontconfig
fribidi
gavl
giflib
frei0r
lame
regex
libcddb
libcdio
libcdio-paranoia
libbs2b
libmodplug
libass
libcaca
libdca
libgsm
libilbc
libjpeg-turbo
libmad
libogg
libvorbis
libtheora
libsoxr
libdvdcss
libdvdread
libdvdnav
openjpeg
speex
opus
flac
libvpx
live555
libutvideo
vidstab
lzo
opencore-amr
libsdl
twolame
vo-aacenc
vo-amrwbenc
wavpack
x264
xavs
xvidcore
EOF
echo "All done"
