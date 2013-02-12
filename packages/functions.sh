# vim: ft=sh
shopt -s nullglob

HOST=i686-w64-mingw32
PREFIX=/usr/${HOST}
CROSS_PREFIX=${HOST}-
export PKG_CONFIG_LIBDIR=${PREFIX}/lib/pkgconfig
export PATH=${PREFIX}/bin:$PATH

MAKEOPTS=-j$(cat /proc/cpuinfo | grep "^processor" | wc -l)
FILENAME=${PACKAGE}-${VERSION}.${EXT}
BUILDDIR=${PACKAGE}-${VERSION}

GLOBAL_CFLAGS="-O2 -mtune=generic -march=i486"

depends()
{
    if [ ! -e "${PREFIX}/$1" ]; then
        echo "missing $1"
        exit 1
    fi
}

pkg_download()
{
    test -f ${FILENAME} || wget -c -O ${FILENAME} ${BASEURL}/${FILENAME}
}

pkg_unpack()
{
    test -z ${BASEURL} && return
    test -d ${FILENAME} || pkg_download

    case ${FILENAME} in
        *.tar.xz)
            decomp=J
            ;;
        *.tar.bz2)
            decomp=j
            ;;
        *.tar.gz)
            decomp=z
            ;;
    esac

    rm -fr ${BUILDDIR}
    tar -$decomp -xf ${FILENAME}
}

pkg_configure()
{
    ( cd ${BUILDDIR} &&                     \
    CFLAGS="${GLOBAL_CFLAGS} ${CFLAGS}"     \
    CXXFLAGS="${GLOBAL_CFLAGS} ${CFLAGS}"   \
    ./configure             \
        --host=${HOST}      \
        --prefix=${PREFIX}  \
        --enable-static     \
        --disable-shared    \
        --disable-nls       \
        ${CONFOPTS} || exit 1
    )
}

pkg_make()
{
    ( cd ${BUILDDIR} && make ${MAKEOPTS} )
}

pkg_install()
{
    ( cd ${BUILDDIR} && make install )
}

apply_patches()
{
    for p in patches/*; do
        patch -p0 -N < $p
    done
}

pre_make_hooks()
{
    # ln -s
    find ${BUILDDIR} -type f -name Makefile -exec sed -i -e 's/ln -s/cp -f/g' {} \;
}

pkg_build()
{
    pkg_unpack
    apply_patches
    test -f ${BUILDDIR}/stamp-h1 || pkg_configure || exit 1
    pre_make_hooks
    pkg_make || exit 1
    pkg_install || exit 1
}

git_clean()
{
    ( cd ${BUILDDIR} && git clean -dfx )
}

distclean()
{
    ( cd ${BUILDDIR} && make distclean )
}

pkg_clean()
{
    rm -fr ${BUILDDIR}
}
