find_package(SWIG 3.0 REQUIRED)
find_package(Java REQUIRED)
find_package(JNI REQUIRED)
include(UseJava)
include(UseSWIG)

list(APPEND swig_inc_dirs
        ${JNI_INCLUDE_DIRS}
        ${CMAKE_CURRENT_SOURCE_DIR}/../inc)

set_source_files_properties(clsj.i
    PROPERTIES
        CPLUSPLUS ON
        INCLUDE_DIRECTORIES "${swig_inc_dirs}")

set(CMAKE_SWIG_FLAGS -package com.neeul)

swig_add_library(clsj_swiggy
    LANGUAGE java
    OUTPUT_DIR ${CMAKE_BINARY_DIR}/swig/com/neeul
    SOURCES clsj.i)

target_include_directories(clsj_swiggy PRIVATE ${swig_inc_dirs})
target_link_libraries(clsj_swiggy PRIVATE clsj)

add_jar(
    clsjJNI
    SOURCES
    ${CMAKE_BINARY_DIR}/swig/com/neeul/clsjJNI.java
    ${CMAKE_BINARY_DIR}/swig/com/neeul/clsj.java
)
add_dependencies(clsjJNI clsj_swiggy)

# Build a testing jar which invokes the jni lib to verify it
add_jar(
    LibTesterMain
    SOURCES main.java
    ENTRY_POINT main
)
add_dependencies(LibTesterMain clsjJNI)

add_custom_command(
    TARGET LibTesterMain
    POST_BUILD
    COMMAND ${Java_JAVA_EXECUTABLE} -Djava.library.path=. -jar LibTesterMain.jar "JNI jar call success"
)

install(FILES ${CMAKE_BINARY_DIR}/swig/clsjJNI.jar DESTINATION lib)
install(TARGETS clsj_swiggy DESTINATION lib)