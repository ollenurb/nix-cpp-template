cmake_minimum_required(VERSION 3.21)

set(PROJECT_NAME CppProject)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS_RELEASE "-Wall -O3")

project(${PROJECT_NAME} LANGUAGES CXX C)

# Change default build directories
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/bin")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/obj")

# Grep headers and sources files
# (Add other subdirectories if needed)
file(GLOB HEADERS src/*.hpp)
file(GLOB SOURCES src/*.cpp)

# Setup dependecies
# find_package(dep_name)

add_executable(${PROJECT_NAME} ${HEADERS} ${SOURCES})
