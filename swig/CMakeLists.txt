find_package(SWIG 3.0 REQUIRED)
find_package(Java REQUIRED)
find_package(JNI REQUIRED)
include(UseJava)
include(UseSWIG)

# TODO: replace this, it pollutes the global include path
INCLUDE_DIRECTORIES(${JNI_INCLUDE_DIRS} ${CMAKE_CURRENT_SOURCE_DIR}/../inc)

set_source_files_properties(clsj.i PROPERTIES
        CPLUSPLUS ON)

swig_add_library(clsj_swiggy
    LANGUAGE java
    OUTPUT_DIR ${CMAKE_BINARY_DIR}/swig
    SOURCES clsj.i)

target_link_libraries(clsj_swiggy PRIVATE clsj)

add_jar(
    clsjJNI
    SOURCES
    ${CMAKE_BINARY_DIR}/swig/clsjJNI.java
    ${CMAKE_BINARY_DIR}/swig/clsj.java
)