# MPlayer/FFmpeg MinGW-w64 Cross Build Environment
# Copyright (c) 2013 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

: ${HOST:="i686-w64-mingw32"}
export HOST

export PREFIX=/usr/${HOST}
export CROSS_PREFIX=${HOST}-

export CROSS_ROOT=/usr/${HOST}
export PKG_CONFIG_LIBDIR=${CROSS_ROOT}/lib/pkgconfig

export PKGDIR=$(test -d ../binaries && cd ../binaries && pwd)

export MAKEOPTS=-j$(cat /proc/cpuinfo | grep "^processor" | wc -l)
case ${HOST} in
    i?86-*-mingw32) GLOBAL_CFLAGS="-O2 -mtune=generic -march=${MARCH:-i486} -DWINVER=_WIN32_WINNT_WINXP" ARCH="x86";;
    x86_64-*-mingw32) GLOBAL_CFLAGS="-O2 -mtune=generic -march=x86-64" ARCH="x86_64" ;;
    *) GLOBAL_CFLAGS="-O2 -mtune=generic" ARCH="x86";;
esac
export GLOBAL_CFLAGS ARCH

toupper()
{
    echo "$@" | tr abcdefghijklmnopqrstuvwxyz- ABCDEFGHIJKLMNOPQRSTUVWXYZ_
}

x86_64()
{
    eval test "${ARCH}" = "x86_64"
}

CONFIGLIST=""
HAVELIST=""

config()
{
    CONFIGLIST="${CONFIGLIST} $1"
}

have()
{
    HAVELIST="${HAVELIST} $1"
}

check_components()
{
    echo "Checking components"
    tempfile=$(mktemp -u /tmp/XXXXXXXX-conf.c)
    (
        echo "#include \"$(pwd)/config.h\""

        for config in ${CONFIGLIST}; do
    cat << EOF
#if CONFIG_$(toupper $config) != 1
#error config not enabled $config
#endif
EOF
        done

        for have in ${HAVELIST}; do
    cat << EOF
#if HAVE_$(toupper $have) != 1
#error dont have $have
#endif
EOF
        done
    ) > $tempfile

    res=$(gcc -c -o /dev/null $tempfile)
    rm -f $tempfile
    return $res
}

copy_data()
{
    test -d "$1" || return
    ( cd "$1" && ( find | cpio -pdvm "$2" ) )
}
