cmake_minimum_required(VERSION 3.10)

project(texa VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

add_subdirectory(src)

include_directories(${PROJECT_SOURCE_DIR}/src)
