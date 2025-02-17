cmake_minimum_required(VERSION 3.10)
project(amf)

add_library(amf INTERFACE)

install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/amf/public/include/
        DESTINATION include/AMF
)
