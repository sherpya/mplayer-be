#!/bin/bash
# MPlayer/FFmpeg MinGW-w64 Cross Build Environment
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

. ../config.sh
. ../nameterm.sh

say()
{
    nameTerminal "$*"
    echo $*
}

product=$(basename $(pwd))
version=$(./ffbuild/version.sh)

CONFIGURE_OPTS=""

add_opt()
{
    CONFIGURE_OPTS="${CONFIGURE_OPTS} $1"
}

enable()
{
    add_opt --enable-$1
}

disable()
{
    add_opt --disable-$1
}

NAME="FFmpeg"
PROGRAM="ffmpeg"
PROGRAMS="ffprobe"

packagedir="${PKGDIR}/${NAME}/git-$version"
packagename="${NAME}-${ARCH}-$version"
package="${packagedir}/${packagename}.7z"
source="${packagedir}/$product-$version-src.tar.xz"

configure()
{
    add_opt --prefix=${PREFIX}
    add_opt --cross-prefix=${CROSS_PREFIX}
    add_opt --extra-ldflags=-static
    add_opt --arch=${ARCH}
    add_opt --target-os=mingw32
    add_opt --extra-version=sherpya

    disable outdevs
    disable ffplay
    disable w32threads
    disable bcrypt

    #enable lto
    enable gpl
    enable version3
    enable hardcoded-tables

    enable cross-compile
    enable runtime-cpudetect
    enable hardcoded-tables
    enable pthreads

    enable avfilter
    enable postproc

    enable libaribb24
    enable avisynth
    config bzlib
    enable frei0r
    config frei0r_filter
    enable mbedtls
    config iconv
    enable libass
    disable libbluray
    enable libbs2b
    disable libcaca
    enable libcdio
    config libcdio
    have cdio_paranoia_paranoia_h
    enable libcodec2
    enable libfdk-aac
    enable fontconfig
    enable libfreetype
    enable libfribidi
    enable libgme
    enable libgsm
    enable libilbc
    enable libkvazaar
    enable libmodplug
    enable libmp3lame
    enable libopencore-amrnb
    enable libopencore-amrwb
    enable libopenh264
    enable libopenjpeg
    enable libopenmpt
    # The CELT codec has been merged into the IETF Opus codec
    enable libopus
    enable libsoxr
    enable libspeex
    enable libtheora
    enable libtwolame
    enable libvidstab
    enable libvo-amrwbenc
    enable libvorbis
    enable libvpx
    enable libwavpack
    enable libwebp
    enable libx264
    enable libx265
    enable libxavs
    enable libxvid
    enable libxml2
    config dash_demuxer
    enable libzimg
    enable ffnvcodec
    config zlib

    ./configure ${CONFIGURE_OPTS} $* || return 1
    check_components || return 1
}

make_dist()
{

    say "Building dist...${package}"
    TMPDIR=$(mktemp -d /tmp/$product-build-XXXX)
    DISTDIR=${TMPDIR}/${packagename}
    mkdir ${DISTDIR}

    for program in ${PROGRAM} ${PROGRAMS}; do
        install -m755 ${program}.exe ${DISTDIR}/${program}.exe
        ${CROSS_PREFIX}strip ${DISTDIR}/${program}.exe
    done

    while read file; do
        install -m644 -D $file ${DISTDIR}/$file
    done << EOF
COPYING.GPLv3
doc/${PROGRAM}.html
doc/faq.html
doc/general.html
EOF

    unix2dos > ${DISTDIR}/README-win32.txt << EOF
${NAME} Win32 binary Builds by Gianluigi Tiesi <sherpya@netfarm.it>

This binary build license is GPLv3.

Modified windows icons are made by using Lila SVG Icon and Theme Artwork:
http://www.lila-center.info/doku.php
Copyright 2004-2006 Lila Community
available under the GNU General Public License

-- Report bugs to sherpya@netfarm.it
EOF

#    mkdir ${DISTDIR}/frei0r-1
#    copy_data ${PREFIX}/lib/frei0r-1 ${DISTDIR}/frei0r-1

    mkdir -p "${packagedir}"
    pkgtemp=$(mktemp -u /tmp/$product-dist-XXXX.7z)
    ( cd ${TMPDIR} && 7z a -mx=9 ${pkgtemp} ${packagename} )
    mv -f ${pkgtemp} "${package}"
    rm -fr ${TMPDIR}

    echo "Done with $package"
}

build_binary()
{
    if [ -e $package ]; then
        echo "$package uptodate"
        return
    fi

    echo "Building $package"

    echo -n "Cleaning..."
    make distclean >/dev/null 2>&1
    echo "done"

    say "Configuring ${NAME} ${ARCH}..."
    configure || return 1

    say "Make ${NAME} ${ARCH}..."
    make -j8 || return 1

    make_dist
}

build_source()
{
    if [ -e $source ]; then
        echo "$source uptodate"
        return
    fi

    say "Generating $source"
    srctemp=$(mktemp -u /tmp/$product-src-XXXX.tar.xz)
    git archive --prefix="$product-$version-src/" --format=tar HEAD | xz -c > ${srctemp}
    mv -f ${srctemp} "${source}"
    echo "Done with $source"
}

eval $*
