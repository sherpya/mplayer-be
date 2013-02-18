#!/bin/sh

. ../config.sh

product=$(basename $(pwd))
version=$(./version.sh)

case "$product" in 
    ffmpeg)
        NAME="FFmpeg"
        PROGRAM="ffmpeg"
        PROGRAMS="ffprobe"
        CUSTOMOPTS="--disable-ffplay --disable-ffserver --enable-postproc --enable-libtwolame --enable-libmodplug"
        ;;
    libav)
        NAME="Libav"
        PROGRAM="avconv"
        PROGRAMS="avprobe"
        CUSTOMOPTS="--disable-avplay --disable-avserver"
        ;;
esac

packagedir="${PKGDIR}/${NAME}/git-$version"
packagename="${NAME}-${ARCH}-$version"
package="${packagedir}/${packagename}.7z"
source="${packagedir}/$product-$version-src.tar.xz"

configure()
{
    ./configure --cross-prefix=${CROSS_PREFIX}  \
        --extra-ldflags="-static"   \
        --arch=x86                  \
        --target-os=mingw32         \
        --enable-cross-compile      \
        --enable-static             \
        --extra-version=Sherpya     \
        --enable-gpl                \
        --enable-version3           \
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
        --enable-libvorbis          \
        --enable-libxavs            \
        --enable-zlib               \
        --enable-bzlib              \
        --enable-libxvid            \
        --enable-libx264            \
        --enable-libspeex           \
        --enable-libvpx             \
        --enable-libfaac            \
        ${CUSTOMOPTS}               \
        $*
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
