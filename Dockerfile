FROM openjdk:8-jdk

RUN apt-get update && apt-get install -y g++ wget swig3.0 make \
    && wget https://cmake.org/files/v3.12/cmake-3.12.2-Linux-x86_64.sh \
    && chmod +x cmake-3.12.2-Linux-x86_64.sh \
    && mkdir -p /opt/cmake \
    && ./cmake-3.12.2-Linux-x86_64.sh --skip-license --prefix=/opt/cmake \
    && ln -sf /opt/cmake/bin/cmake /usr/bin/cmake

