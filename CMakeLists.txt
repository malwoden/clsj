cmake_minimum_required(VERSION 3.12.2)
project(clsj VERSION 0.1.0)

option(CLSJ_SWIG_JNI "Build a swig generated JNI library" OFF)

add_library(clsj
        src/word.cpp)

target_include_directories(clsj PUBLIC inc)

target_compile_options(clsj PRIVATE -Wall -Wextra -pedantic -fPIC)

target_compile_features(clsj PUBLIC cxx_std_17)
set_property(TARGET clsj PROPERTY CXX_EXTENSIONS OFF)

if(CLSJ_SWIG_JNI)
    add_subdirectory(swig)
endif()

install(TARGETS clsj DESTINATION lib)
install(FILES inc/word.h DESTINATION include)