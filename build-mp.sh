#!/bin/sh

. ../config.sh

revision=$(LC_ALL=C git svn info 2> /dev/null | grep Revision | cut -d' ' -f2)
version=r${revision}
packagedir="${PKGDIR}/MPlayer and MEncoder/revision $revision"
source="${packagedir}/mplayer-$version-src.tar.xz"

configure()
{
    ./configure                             \
        --prefix=.                          \
        --enable-cross-compile              \
        --host-cc=gcc                       \
        --cc=${CROSS_PREFIX}gcc             \
        --as=${CROSS_PREFIX}as              \
        --ar=${CROSS_PREFIX}ar              \
        --nm=${CROSS_PREFIX}nm              \
        --ranlib=${CROSS_PREFIX}ranlib      \
        --windres=${CROSS_PREFIX}windres    \
        --enable-static                     \
        --enable-md5sum                     \
        --enable-menu                       \
        --enable-enca                       \
        --enable-sdl                        \
        --enable-caca                       \
        --enable-gl                         \
        --enable-freetype                   \
        --enable-png                        \
        --enable-jpeg                       \
        --enable-gif                        \
        --enable-tga                        \
        --enable-mad                        \
        --enable-tv                         \
        --enable-theora                     \
        --enable-faac                       \
        --disable-vidix                     \
        --disable-faac-lavc                 \
        --disable-inet6                     \
        --extra-cflags="-I${CROSS_ROOT}/live" \
        $*
}

make_dist()
{
    echo "Build dist..."

    TMPDIR=$(mktemp -d /tmp/mpbuild-XXXX)
    DISTDIR=${TMPDIR}/MPlayer-$flavor-$version
    mkdir ${DISTDIR}

    for exe in mplayer.exe mencoder.exe; do
        install -m755 -D $exe ${DISTDIR}/$exe
        ${CROSS_PREFIX}strip ${DISTDIR}/${exe}
    done

    make html-single && install -m644 -D DOCS/HTML/en/MPlayer.html ${DISTDIR}/MPlayer.html
    groff -mman -Thtml DOCS/man/en/mplayer.1 > ${DISTDIR}/MPlayer.man.html
    unix2dos -n LICENSE ${DISTDIR}/LICENSE.txt

    ( cd ../dist/MPlayer && ( find | cpio -pdvm ${DISTDIR} ))

    mkdir -p "${packagedir}"
    ( cd ${TMPDIR} && 7z a -mx=9 "$package" MPlayer-$flavor-$version )
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
    flavor=$1
    package="${packagedir}/MPlayer-$flavor-$version.7z"

    if [ -e "$package" ]; then
        echo "$package uptodate"
        return
    fi

    echo "Building $package"

    if [ "$flavor" = "rtm" ]; then
        opts="--enable-runtime-cpudetection"
    else
        opts="--flavor=$flavor"
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

if [ ! -z "${C}" ]; then
    configure $*
    exit 0
fi

build_source
build_binary i7
build_binary p4
build_binary p3
build_binary athlon
build_binary rtm
