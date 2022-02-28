project(bzip2)
cmake_minimum_required(VERSION 3.0)

set(bzip2_SRCS blocksort.c
               huffman.c
               crctable.c
               randtable.c
               compress.c
               decompress.c
               bzlib.c)

add_definitions(-D_FILE_OFFSET_BITS=64)

set(EXPORTED_HEADERS bzlib.h)
add_library(bz2 STATIC ${bzip2_SRCS})

install(TARGETS bz2 ARCHIVE DESTINATION lib${LIB_SUFFIX})
install(FILES ${EXPORTED_HEADERS} DESTINATION include)
