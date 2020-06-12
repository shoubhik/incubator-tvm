#!/bin/bash
cd ~/tvm
rm -r build
mkdir -p build
cd build
cp ../cmake/config.cmake .
echo set\(USE_SORT ON\) >> config.cmake
echo set\(USE_MICRO ON\) >> config.cmake
echo set\(USE_MICRO_STANDALONE_RUNTIME ON\) >> config.cmake
echo set\(USE_GRAPH_RUNTIME_DEBUG ON\) >> config.cmake
echo set\(USE_VM_PROFILER ON\) >> config.cmake
echo set\(USE_EXAMPLE_EXT_RUNTIME ON\) >> config.cmake
echo set\(USE_LLVM /llvm/bin/llvm-config \) >> config.cmake
echo set\(USE_NNPACK ON\) >> config.cmake
echo set\(NNPACK_PATH /NNPACK/build/\) >> config.cmake
echo set\(USE_ANTLR ON\) >> config.cmake
echo set\(CMAKE_CXX_COMPILER g++\) >> config.cmake
echo set\(CMAKE_CXX_FLAGS -Werror\) >> config.cmake
echo set\(HIDE_PRIVATE_SYMBOLS ON\) >> config.cmake
cd ~/tvm

# Run following command from ~/tvm to build:
# docker/build.sh ci_cpu './tests/scripts/task_build.sh build -j4'

