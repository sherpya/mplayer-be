#!/bin/bash
# MPlayer/FFmpeg MinGW-w64 Cross Build Environment
# Copyright (c) 2013-2014 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

grep -q enabled /proc/sys/fs/binfmt_misc/status 2>/dev/null && \
 { echo 'binfmt support is enabled, aborting - disable with:' ; \
    echo 'echo 0 | sudo tee /proc/sys/fs/binfmt_misc/status'; exit 1; }

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
dlfcn-win32
zlib
bzip2
libiconv
enca
expat
faac
fdk-aac
libpng
freetype
fontconfig
fribidi
gavl
giflib
frei0r
lame
regex
gmp
nettle
gnutls
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
libxml2
libbluray
openjpeg
libwebp
gme
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
x265
xavs
xvidcore
EOF
echo "All done"
