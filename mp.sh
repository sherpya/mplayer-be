#!/bin/bash
# MPlayer/FFmpeg MinGW-w64 Cross Build Environment
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

. ../config.sh

version=$(LC_ALL=C git svn info 2> /dev/null | grep Revision | cut -d' ' -f2)
ff_revision=$(( cd ../ffmpeg && LC_ALL=C git rev-parse --short upstream/master )2> /dev/null)
version=r${version}+g${ff_revision}
packagedir="${PKGDIR}/MPlayer and MEncoder/${version}"
source="${packagedir}/mplayer-$version-src.tar.xz"

have yasm
have pthreads

config iconv
config caca
config png
config jpeg
config gif
config sdl
config dvdread
config libcdio
config freetype
config fontconfig
config fribidi
config enca
config zlib
config bzlib
config liblzo
config libmad
config twolame
config oggvorbis
config speex
config libgsm
config oggtheora
config libdca
config libilbc
config libopus
config libbs2b
config live555
config libopencore_amrnb
config libopencore_amrwb
config libmodplug
config libopenjpeg
config libxvid
config libx264
config mp3lame
config dvdnav
config vcd

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

configure()
{
    add_opt --prefix=/invalid
    add_opt --host-cc=gcc
    add_opt --cc=${CROSS_PREFIX}gcc
    add_opt --as=${CROSS_PREFIX}as
    add_opt --ar=${CROSS_PREFIX}ar
    add_opt --nm=${CROSS_PREFIX}nm
    add_opt --ranlib=${CROSS_PREFIX}ranlib
    add_opt --windres=${CROSS_PREFIX}windres

    enable cross-compile
    enable runtime-cpudetection
    enable static
    enable postproc

    disable vidix
    disable inet6

	enable dvdnav
	enable dvdread

    enable bluray

    enable menu
    enable faac
    disable faac-lavc

    enable libfdk-aac

    add_opt --extra-cflags="-I${CROSS_ROOT}/live"

	echo configure ${CONFIGURE_OPTS} $*
    ./configure ${CONFIGURE_OPTS} $* || return 1
    check_components || return 1
}

make_dist()
{
    echo "Building dist..."

    TMPDIR=$(mktemp -d /tmp/mpbuild-XXXX)
    DISTDIR=${TMPDIR}/MPlayer-$cpu-$version
    mkdir ${DISTDIR}

    for exe in mplayer.exe mencoder.exe; do
        install -m755 -D $exe ${DISTDIR}/$exe
        ${CROSS_PREFIX}strip ${DISTDIR}/${exe}
    done

    make html-single && install -m644 -D DOCS/HTML/en/MPlayer.html ${DISTDIR}/MPlayer.html
    groff -mman -Thtml DOCS/man/en/mplayer.1 > ${DISTDIR}/MPlayer.man.html
    unix2dos -n LICENSE ${DISTDIR}/LICENSE.txt

    DATADIR=../dist/MPlayer
    copy_data ${DATADIR}/common ${DISTDIR}
    copy_data ${DATADIR}/${ARCH} ${DISTDIR}
    
    mkdir -p "${packagedir}"
    pkgtemp=$(mktemp -u /tmp/mp-dist-XXXX.7z)
    ( cd ${TMPDIR} && 7z a -mx=9 ${pkgtemp} MPlayer-$cpu-$version )
    mv -f ${pkgtemp} "${package}"
    rm -fr ${TMPDIR}

    echo "Done with $package"
}

distclean()
{
    echo -n "Cleaning..."
    make distclean >/dev/null 2>&1
    echo "done"
}

build_binary()
{
    cpu=$1
    package="${packagedir}/MPlayer-$cpu-$version.7z"

    if [ -e "$package" ]; then
        echo "$package uptodate"
        return
    fi

    echo "Building $package"

    if [ "$cpu" = "generic" ]; then
        opts="--with-arch=i486 --with-tune=generic"
    elif [ "$cpu" = "x86_64" ]; then
        opts="--with-arch=x86-64 --with-tune=generic"
    else
        opts="--with-arch=$cpu --with-tune=$cpu"
    fi

    distclean

    echo "Configuring..."
    configure $opts || return 1

    echo "Make..."
    make -j8 || return 1

    make_dist
}

build_source()
{
    if [ -e "$source" ]; then
        echo "$source uptodate"
        return
    fi

    echo "Generating $source"
    distclean

    ( cd ffmpeg && git pull --rebase --ff-only )

    echo -n "Building $source ..."
    echo sherpya-$version > VERSION
    mkdir -p "${packagedir}"
    srctemp=$(mktemp -u /tmp/mp-src-XXXX.tar.xz)
    ( cd .. && tar --exclude-vcs -cJf ${srctemp} mplayer )
    mv -f ${srctemp} "${source}"
    rm -f VERSION

    echo "Done with $source"
}

eval $*
