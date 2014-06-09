# vim: ft=sh:
# MPlayer/FFmpeg MinGW-w64 Cross Build Environment
# Copyright (c) 2013-2014 Gianluigi Tiesi <sherpya@netfarm.it>
# See LICENSE for licensing informations

topdir=$(cd .. && pwd)

. $(dirname $0)/../../config.sh

# load ac cache
if [ -z ${NOCACHE} ]; then
    echo Loading ac cache
    . ${topdir}/ac_cache.sh
fi

GLOBAL_CFLAGS="${GLOBAL_CFLAGS} -mno-ms-bitfields -Werror=pointer-to-int-cast"

shopt -s nullglob

FILENAME=${PACKAGE}-${VERSION}.${EXT}
BUILDDIR=${PACKAGE}-${VERSION}

sanity_check()
{
    for dir in bin include lib; do
        if [ ! -d ${PREFIX}/$dir ]; then
            echo "${PREFIX}/$dir is not a directory"
            exit 1
        fi
        if [ ! -w ${PREFIX}/$dir ]; then
            echo "${PREFIX}/$dir is not writable"
            exit 1
        fi
    done
}
sanity_check

export_toolchain()
{
    export AR=${CROSS_PREFIX}ar
    export RANLIB=${CROSS_PREFIX}ranlib
    export STRIP=${CROSS_PREFIX}strip
    export CC=${CROSS_PREFIX}gcc
    export CXX=${CROSS_PREFIX}g++
}

save_function()
{
    local ORIG_FUNC=$(declare -f $1)
    local NEWNAME_FUNC="$2${ORIG_FUNC#$1}"
    eval "$NEWNAME_FUNC"
}

depends()
{
    if [ ! -e "${PREFIX}/$1" ]; then
        echo "Missing dependency $1"
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
    test -f ${FILENAME} || wget -c -O ${FILENAME} ${BASEURL}/${FILENAME} || ( rm -f ${FILENAME} ; return 1 )
}

pkg_unpack()
{
    if [ -n "${GIT_REPO}" ]; then
        test -d ${BUILDDIR}/.git || ( git clone ${GIT_REPO} ${BUILDDIR} || return 1 )
        return 0
    fi

    if [ -n "${SVN_REPO}" ]; then
        test -d ${BUILDDIR}/.svn || ( svn co ${SVN_REPO} ${BUILDDIR} || return 1 )
        return 0
    fi

    test -z ${BASEURL} && return
    test -d ${FILENAME} || pkg_download || return 1

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

is_cmake()
{
    # [ -e CMakeLists.txt ]
    [ -n "${CMAKE}" ]
}

pkg_configure_cmake()
{
    mkdir build_cross
    ( cd build_cross && cmake               \
        -DCMAKE_BUILD_TYPE=Release          \
        -DBUILD_SHARED_LIBS=0               \
        -DCMAKE_INSTALL_PREFIX=${PREFIX}    \
        -DCMAKE_TOOLCHAIN_FILE=$topdir/toolchain.cmake \
        ${CMAKEOPTS} ..
    ) || return 1
}

pkg_configure()
{
    if is_cmake; then
        pkg_configure_cmake
        return $?
    fi

    if [ ! -x configure ]; then
        if [ -e configure.ac -o -e configure.in ]; then
            autoreconf -fi
        else
            return 0
        fi
    fi

    test -n "${C}" && CONFOPTS="-C ${CONFOPTS}"

    CFLAGS="${GLOBAL_CFLAGS} ${CFLAGS}"     \
    CXXFLAGS="${GLOBAL_CFLAGS} ${CFLAGS}"   \
    ./configure             \
        --host=${HOST}      \
        --prefix=${PREFIX}  \
        --enable-static     \
        --disable-shared    \
        ${CONFOPTS} || return 1
}

pkg_make_target()
{
    is_cmake && cd build_cross
    make ${MAKEOPTS} || return 1
    make install || return 1
}

apply_patches()
{
    test -z "${NP}" || return 0
    test -d ${BUILDDIR} || return 0

    for p in $(pwd)/patches/*; do
        echo "- Appling $(basename $p)"
         patch -d ${BUILDDIR} -p1 < $p || return 1
    done
}

print_file_name()
{
    ${CROSS_PREFIX}gcc -print-file-name=$1
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

ln_to_cp()
{
    # ln -s -> cp -f
    find . -type f -name Makefile -exec sed -i -e 's/ln -s/cp -f/g' {} \;
}

pkg_build()
{
    pkg_unpack || return 1
    apply_patches || return 1

    ( cd ${BUILDDIR} && pkg_configure ) || return 1
    ( cd ${BUILDDIR} && ln_to_cp )
    test -n "${C}" && exit 0
    ( cd ${BUILDDIR} && pkg_make_target ) || return 1

    fix_la
}

git_clean()
{
    test -d ${BUILDDIR} || return 0
    ( cd ${BUILDDIR} && git reset --hard && git clean -qdfx )
}

cmake_clean()
{
    test -d ${BUILDDIR} || return 0
    ( cd ${BUILDDIR} && rm -fr build_cross )
}

distclean()
{
    test -d ${BUILDDIR} || return 0
    ( cd ${BUILDDIR} && ( make distclean > /dev/null 2>&1 || true ) )
}

pkg_clean()
{
    rm -fr ${BUILDDIR}
}
