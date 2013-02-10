export HOST=i686-w64-mingw32
export CROSS_PREFIX=${HOST}-

export CROSS_ROOT=/usr/${HOST}
export PATH=${CROSS_ROOT}/bin:${PATH}
export PKG_CONFIG_LIBDIR=${CROSS_ROOT}/lib/pkgconfig

export PKGDIR=$(cd ../binaries && pwd)
