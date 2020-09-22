FROM nvidia/cuda:9.2-base
ADD . /embree/
WORKDIR /embree/
RUN apt-get update && apt-get install -y cmake g++ libtbb-dev \
libglfw3-dev git pkg-config && \
mkdir build && mkdir ../install
WORKDIR /embree/build
RUN cmake -DEMBREE_ISPC_SUPPORT=0 .. && make && \
cmake -DCMAKE_INSTALL_PREFIX=/embree/install -P cmake_install.cmake
#MKDIR build
#WORKDIR build
