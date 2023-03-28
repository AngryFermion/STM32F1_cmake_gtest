cmake_minimum_required(VERSION 3.16)
project(source C CXX ASM)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(CMAKE_EXPORT_COMPILE_COMMANDS "ON")
add_subdirectory(testfiles)
add_subdirectory(gtest)

