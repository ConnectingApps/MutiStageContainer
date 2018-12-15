cmake_minimum_required(VERSION 3.10)
project(lib)

set(CMAKE_CXX_STANDARD 14)

add_library(lib SHARED lib.cpp)