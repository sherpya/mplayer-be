#!/bin/sh

. ../config.sh

version=$(./version.sh)
packagedir="${PKGDIR}/FFmpeg/git-$version"
package="${packagedir}/FFmpeg-$version.7z"
source="${packagedir}/ffmpeg-$version-src.tar.xz"

configure()
{
    ./configure --cross-prefix=${CROSS_PREFIX} \
        --arch=x86                  \
        --target-os=mingw32         \
        --enable-cross-compile      \
        --extra-version=Sherpya     \
        --enable-gpl                \
        --enable-version3           \
        --disable-ffplay            \
        --disable-ffserver          \
        --enable-postproc           \
        --enable-avfilter           \
        --enable-pthreads           \
        --enable-runtime-cpudetect  \
        --enable-hardcoded-tables   \
        --enable-memalign-hack      \
        --enable-avisynth           \
        --enable-libopencore-amrnb  \
        --enable-libopencore-amrwb  \
        --enable-libtheora          \
        --enable-libfreetype        \
        --enable-libmp3lame         \
        --enable-libtwolame         \
        --enable-libvorbis          \
        --enable-zlib               \
        --enable-bzlib              \
        --enable-libxvid            \
        --enable-libx264            \
        --enable-libspeex           \
        --enable-libfaac            \
        --enable-libvpx             \
        $*
}

make_dist()
{
    echo "Build dist..."
    TMPDIR=$(mktemp -d /tmp/ffbuild-XXXX)
    DISTDIR=${TMPDIR}/FFmpeg-$version
    mkdir ${DISTDIR}

    while read file; do
        if [ "${file:(-3)}" = "exe" ]; then
            mode=0755
        else
            mode=0644
        fi
        install -m$mode -D $file ${DISTDIR}/$file
    done << EOF
ffmpeg.exe
ffprobe.exe
COPYING.GPLv3
doc/ffmpeg.html
doc/faq.html
doc/general.html
EOF

    unix2dos > ${DISTDIR}/README-win32.txt << EOF
FFmpeg Win32 binary Builds by Gianluigi Tiesi <sherpya@netfarm.it>

This binary build license is GPLv3.

Modified windows icons are made by using Lila SVG Icon and Theme Artwork:
http://www.lila-center.info/doku.php
Copyright 2004-2006 Lila Community
available under the GNU General Public License

-- Report bugs to sherpya@netfarm.it
EOF

    mkdir -p "${packagedir}"
    ( cd ${TMPDIR} && 7z a -mx=9 "$package" FFmpeg-$version )
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
    git archive --prefix="ffmpeg-$version-src/" --format=tar HEAD | xz -c > "$source"
}

build_binary
build_source
