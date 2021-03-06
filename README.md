# clsj
c++ library + swig + java

A toy project for testing cmake's swig functionality.
Builds a simple JNI jar, as part of the build the JNI jar will be invoked to test the build.

Requires CMake 3.12.2, JAVA (tested with openjdk 8) and Swig 3.0 (or newer)

# Build instructions

The following produces a clsj dynamic lib, a clsg_swiggy dynamic lib generated by swig and a clsjJNI.jar also generated by swig.

```
mkdir build && cd build
cmake -DCLSJ_SWIG_JNI=ON -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=./ins  ..
make
```

Cmake options:
- `CLSJ_SWIG_JNI` - enables the swig generated library to be built. This always produces a dynamic library (clsj_swiggy).
- `BUILD_SHARED_LIBS` - shared or static build of the clsj lib.
