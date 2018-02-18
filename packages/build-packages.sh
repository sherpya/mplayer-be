#!/bin/bash
# MPlayer/FFmpeg MinGW-w64 Cross Build Environment
# Copyright (c) 2013-2018 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

grep -q enabled /proc/sys/fs/binfmt_misc/status 2>/dev/null && \
 { echo 'binfmt support is enabled, aborting - disable with:' ; \
    echo 'echo 0 | sudo tee /proc/sys/fs/binfmt_misc/status'; exit 1; }

. ../nameterm.sh

case ${HOST} in
    i?86-*-mingw32) ARCH="x86" ;;
    x86_64-*-mingw32) ARCH="x86_64" ;;
    *) ARCH="x86" ;;
esac

while read package; do
    pushd $package
    nameTerminal "Building $package for ${ARCH}"

    echo -n "Building $package..."
    ./build.sh

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
kvazaar
openh264
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
libopenmpt
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
openjpeg
libwebp
gme
speex
opus
flac
libvpx
live555
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
