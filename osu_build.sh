#!/bin/bash

# This script builds and installs the OSU microbenchmarks

mpicc=$1
mpicxx=$2

pwd=$(pwd)
autoreconf -fi
./configure --prefix=${pwd}/build --enable-sycl --with-sycl=/opt/aurora/24.180.3/updates/oneapi/compiler/eng-20240629 CC=$mpicc CXX=$mpicxx
make
make install
