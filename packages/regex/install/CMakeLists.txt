project(libregex)
cmake_minimum_required(VERSION 2.8)

add_definitions(-DSTDC_HEADERS=1)

include(CheckIncludeFile)
check_include_file(string.h HAVE_STRING_H)

if(HAVE_STRING_H)
add_definitions(-DHAVE_STRING_H=1)
endif()

set(EXPORTED_HEADERS regex.h)
add_library(regex STATIC regex.c)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/inc)

install(TARGETS regex ARCHIVE DESTINATION lib${LIB_SUFFIX})
install(FILES ${EXPORTED_HEADERS} DESTINATION include)
