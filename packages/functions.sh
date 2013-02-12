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

do_single_target()
{
    MAKEFILES=$(find ${BUILDDIR} -name Makefile)
    for makefile in ${MAKEFILES}; do
        grep -q $1 $makefile && ( cd $(dirname $makefile) && make $1)
    done
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

make_ld_script()
{
    eval $(grep dependency_libs= $1)
    eval $(grep old_library= $1)
    libname="${old_library:3:-2}_s"

    LIBS=""
    for lib in $dependency_libs; do
        case $lib in
            -L*) ;;
            -lm) ;;
            -lc) ;;
            -l*) LIBS="${LIBS} $lib" ;;
        esac
    done

    test -z "${LIBS}" && return

    echo "GROUP ( -l${libname}${LIBS} )"
}

fix_la()
{
    test -z "${STATICLIBS}" && return

    for lib in ${STATICLIBS}; do

        lib_a=${PREFIX}/lib/${lib}.a
        lib_s=${PREFIX}/lib/${lib}_s.a
        lib_la=${PREFIX}/lib/${lib}.la

        test -e $lib_la || continue
        echo "Fixing static lib $lib..."
        rm -f $lib_s

        LDSCRIPT=$(make_ld_script $lib_la)
        rm -f $lib_la

        test -e $lib_a || continue
        test -z "${LDSCRIPT}" && continue

        mv -f $lib_a $lib_s
        echo ${LDSCRIPT} > $lib_a

    done
}

pkg_build()
{
    pkg_unpack
    apply_patches
    test -f ${BUILDDIR}/stamp-h1 || pkg_configure || exit 1
    pre_make_hooks
    pkg_make || exit 1
    pkg_install || exit 1
    fix_la
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
