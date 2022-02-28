project(openh264)
cmake_minimum_required(VERSION 3.0)

include(GNUInstallDirs)

set(SRC_PATH ${CMAKE_SOURCE_DIR}/codec)

# generate version_gen.h
execute_process(COMMAND git rev-parse --short HEAD OUTPUT_VARIABLE GIT_REVISION OUTPUT_STRIP_TRAILING_WHITESPACE)
configure_file("${CMAKE_SOURCE_DIR}/version_gen.h.cmakein" "${CMAKE_BINARY_DIR}/version_gen.h")

set(VERSION "2.1.0")

enable_language(ASM_NASM)
if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    set(CMAKE_ASM_NASM_OBJECT_FORMAT win64)
    set(CMAKE_ASM_NASM_FLAGS "-DWIN64")
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
    set(CMAKE_ASM_NASM_OBJECT_FORMAT win32)
    set(CMAKE_ASM_NASM_FLAGS "-DPREFIX -DX86_32")
    add_definitions(-DX86_32_ASM)
endif()

# -DHAVE_AVX2 does not work o windows?
add_definitions(-DX86_ASM -DGENERATED_VERSION_HEADER)
include_directories(
    ${CMAKE_BINARY_DIR}
    ${SRC_PATH}/api/svc
    ${SRC_PATH}/common/inc
    ${SRC_PATH}/common/x86
    ${SRC_PATH}/processing/interface
)

file(GLOB_RECURSE common_srcs
    ${SRC_PATH}/common/*.cpp
    ${SRC_PATH}/common/*.asm)
list(REMOVE_ITEM common_srcs ${SRC_PATH}/common/x86/asm_inc.asm)

file(GLOB_RECURSE decoder_srcs
    ${SRC_PATH}/decoder/*.cpp
    ${SRC_PATH}/decoder/*.asm
)
set_source_files_properties(${decoder_srcs}
    PROPERTIES
    INCLUDE_DIRECTORIES "${SRC_PATH}/decoder/core/inc;${SRC_PATH}/decoder/plus/inc"
)

file(GLOB_RECURSE encoder_srcs
    ${SRC_PATH}/encoder/*.cpp
    ${SRC_PATH}/encoder/*.asm
)
list(REMOVE_ITEM encoder_srcs ${SRC_PATH}/encoder/plus/src/DllEntry.cpp)
set_source_files_properties(${encoder_srcs}
    PROPERTIES
    INCLUDE_DIRECTORIES "${SRC_PATH}/encoder/core/inc;${SRC_PATH}/encoder/plus/inc"
)

file(GLOB_RECURSE processing_srcs
    ${SRC_PATH}/processing/*.cpp
    ${SRC_PATH}/processing/*.asm
)
set_source_files_properties(${processing_srcs}
    PROPERTIES
    INCLUDE_DIRECTORIES "${SRC_PATH}/processing/src/common"
)

file(GLOB dist_headers ${SRC_PATH}/api/svc/*.h)
add_library(openh264 STATIC ${common_srcs} ${decoder_srcs} ${encoder_srcs} ${processing_srcs})

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/openh264.pc.cmakein ${CMAKE_CURRENT_BINARY_DIR}/openh264.pc @ONLY)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/openh264.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
install(FILES ${dist_headers} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/wels)
install(TARGETS openh264 ARCHIVE DESTINATION lib${LIB_SUFFIX})
