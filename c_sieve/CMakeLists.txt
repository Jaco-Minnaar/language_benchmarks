# cmake_minimum_required(VERSION <specify CMake version here>)
project(c_test C)

set(CMAKE_C_STANDARD 99)

add_executable(c_test main.c)
target_link_libraries(c_test PRIVATE m)