project(giflib)
cmake_minimum_required(VERSION 3.0)

set(giflib_SRCS dgif_lib.c
                egif_lib.c
                gifalloc.c
                gif_err.c
                gif_font.c
                gif_hash.c
                openbsd-reallocarray.c)

add_definitions(-Wall -Wno-format-truncation)

set(EXPORTED_HEADERS gif_lib.h)
add_library(gif STATIC ${giflib_SRCS} quantize.c)

install(TARGETS gif ARCHIVE DESTINATION lib${LIB_SUFFIX})
install(FILES ${EXPORTED_HEADERS} DESTINATION include)
