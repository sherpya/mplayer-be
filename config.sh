: ${HOST:="i686-w64-mingw32"}
export HOST

export PREFIX=/usr/${HOST}
export CROSS_PREFIX=${HOST}-

export CROSS_ROOT=/usr/${HOST}
export PATH=${CROSS_ROOT}/bin:${PATH}
export PKG_CONFIG_LIBDIR=${CROSS_ROOT}/lib/pkgconfig

export PKGDIR=$(test -d ../binaries && cd ../binaries && pwd)

export MAKEOPTS=-j$(cat /proc/cpuinfo | grep "^processor" | wc -l)
case ${HOST} in
    i?86-*-mingw32) GLOBAL_CFLAGS="-O2 -mtune=generic -march=i486" ARCH="x86";;
    x86_64-*-mingw32) GLOBAL_CFLAGS="-O2 -mtune=generic -march=x86-64" ARCH="x86_64" ;;
esac
export GLOBAL_CFLAGS ARCH
