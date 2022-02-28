project(libgsm)
cmake_minimum_required(VERSION 3.0)

set(libgsm_SRCS src/add.c
                src/code.c
                src/debug.c
                src/decode.c
                src/long_term.c
                src/lpc.c
                src/preprocess.c
                src/rpe.c
                src/gsm_destroy.c
                src/gsm_decode.c
                src/gsm_encode.c
                src/gsm_explode.c
                src/gsm_implode.c
                src/gsm_create.c
                src/gsm_print.c
                src/gsm_option.c
                src/short_term.c
                src/table.c)

add_definitions(-DNeedFunctionPrototypes=1)
add_definitions(-DSASR -DWAV49)
add_compile_options(-Wall -Wno-comment)

set(EXPORTED_HEADERS inc/gsm.h)
add_library(gsm STATIC ${libgsm_SRCS})

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/inc)

install(TARGETS gsm ARCHIVE DESTINATION lib${LIB_SUFFIX})
install(FILES ${EXPORTED_HEADERS} DESTINATION include/gsm)
