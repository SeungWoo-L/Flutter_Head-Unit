cmake_minimum_required(VERSION 3.10)
project(myvsomeip LANGUAGES CXX C)                         

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")

find_package (vsomeip3 3.3.0 REQUIRED)
find_package(Boost 1.55 COMPONENTS system thread log REQUIRED)

include_directories(
  ./include
  ${Boost_INCLUDE_DIR}
  ${VSOMEIP_INCLUDE_DIRS}
)

add_library(myvsomeip
  SHARED
  ./src/vsomeip.cpp
)
target_link_libraries(myvsomeip vsomeip3 ${Boost_LIBRARIES})
