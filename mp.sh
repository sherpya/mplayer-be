#!/bin/sh

. ../config.sh

version=$(LC_ALL=C git svn info 2> /dev/null | grep Revision | cut -d' ' -f2)
gitrev=$(LC_ALL=C git describe --always 2>/dev/null)
version=r${version}+g${gitrev}
packagedir="${PKGDIR}/MPlayer and MEncoder/${version}"
source="${packagedir}/mplayer-$version-src.tar.xz"

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
    # pthreads (auto)

    enable sdl
    enable caca
    disable vidix
    disable inet6

    # iconv (auto)
    enable fribidi
    enable enca

    enable freetype
    enable fontconfig

    enable menu

    # live (auto)
    add_opt --extra-cflags="-I${CROSS_ROOT}/live"

    enable gif
    enable png
    enable jpeg
    enable liblzo

    # xvid (auto)
    # x264 (auto)

    # libvorbis (auto)
    enable speex
    enable theora
    enable faac
    disable faac-lavc

    enable libgsm
    enable libilbc
    enable libopus
    enable libopencore_amrnb
    enable libopencore_amrwb
    enable libmodplug

    enable mad
    enable mp3lame
    enable twolame
    # libdca (auto)

    ./configure ${CONFIGURE_OPTS} $*
}

copy_data()
{
    test -d "$1" || return
    ( cd "$1" && ( find | cpio -pdvm "$2" ) )
}

make_dist()
{
    echo "Build dist..."

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
    ( cd ${TMPDIR} && 7z a -mx=9 "$package" MPlayer-$cpu-$version )
    rm -fr ${TMPDIR}

    echo "Done with $package"
}

distclean()
{
    echo -n "Clean..."
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

    echo "Configure..."
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

    echo -n "Building $source ..."
    echo sherpya-$version > VERSION
    mkdir -p "${packagedir}"
    ( cd .. && tar --exclude-vcs -cJf "$source" mplayer )
    rm -f VERSION
    echo "done"
}

eval $*
