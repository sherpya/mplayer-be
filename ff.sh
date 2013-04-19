#!/bin/bash

. ../config.sh

product=$(basename $(pwd))
version=$(./version.sh)

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

case "$product" in 
    ffmpeg)
        NAME="FFmpeg"
        PROGRAM="ffmpeg"
        PROGRAMS="ffprobe"
        disable ffplay
        disable ffserver
        enable postproc
        enable fontconfig
        enable libass
        enable libmodplug
        enable libtwolame
        enable libsoxr
        enable libutvideo
        enable frei0r
        config frei0r_filter
        ;;
    libav)
        NAME="Libav"
        PROGRAM="avconv"
        PROGRAMS="avprobe"
        disable avplay
        disable avserver
        ;;
esac

config bzlib
config zlib
config libcdio
have cdio_paranoia_h

packagedir="${PKGDIR}/${NAME}/git-$version"
packagename="${NAME}-${ARCH}-$version"
package="${packagedir}/${packagename}.7z"
source="${packagedir}/$product-$version-src.tar.xz"

configure()
{
    add_opt --prefix=/invalid
    add_opt --cross-prefix=${CROSS_PREFIX}
    add_opt --extra-ldflags=-static
    add_opt --arch=x86
    add_opt --target-os=mingw32
    add_opt --extra-version=Sherpya

    disable outdevs

    enable gpl
    enable version3

    enable cross-compile
    enable runtime-cpudetect
    enable hardcoded-tables
    enable memalign-hack

    enable avfilter
    enable avresample
    enable pthreads

    enable avisynth
    enable libcdio
    enable libfaac
    enable libfreetype
    enable libgsm
    enable libilbc
    enable libmp3lame
    enable libopencore-amrnb
    enable libopencore-amrwb
    enable libopus
    enable libopenjpeg
    enable libspeex
    enable libtheora
    enable libvo-aacenc
    enable libvo-amrwbenc
    enable libvorbis
    enable libvpx
    enable libx264
    enable libxavs
    enable libxvid

    ./configure ${CONFIGURE_OPTS} $* || return 1
    check_components || return 1
}

make_dist()
{

    echo "Build dist..."
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
    ( cd ${TMPDIR} && 7z a -mx=9 "$package" ${packagename} )
    rm -fr ${TMPDIR}
}

build_binary()
{
    if [ -e $package ]; then
        echo "$package uptodate"
        return
    fi

    echo "Building $package"

    echo -n "Clean..."
    make distclean >/dev/null 2>&1
    echo "done"

    echo "Configure..."
    configure || return 1

    echo "Make..."
    make -j8 || return 1

    make_dist
}

build_source()
{
    if [ -e $source ]; then
        echo "$source uptodate"
        return
    fi

    echo "Generating $source"
    git archive --prefix="$product-$version-src/" --format=tar HEAD | xz -c > "$source"
}

eval $*
