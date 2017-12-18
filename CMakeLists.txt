cmake_minimum_required(VERSION 3.0)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

option(BUILD_EXAMPLES "Build examples" OFF)
option(BUILD_TESTS "Build tests" OFF)

project(vector)
set(VECTOR_VERSION_MAJOR 0)
set(VECTOR_VERSION_MINOR 1)
set(VECTOR_VERSION_PATCH 0)
set(VECTOR_VERSION_TWEAK 0)
set(VECTOR_VERSION 
${VECTOR_VERSION_MAJOR}.${VECTOR_VERSION_MINOR}.${VECTOR_VERSION_PATCH}.${VECTOR_VERSION_TWEAK})
set(VECTOR_VERSION_STRING "v${VECTOR_VERSION}")

add_library(vector ${CMAKE_CURRENT_SOURCE_DIR}/sources/vector.cpp)


target_include_directories(vector PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:include>
)

if(BUILD_EXAMPLES)
  file(GLOB EXAMPLE_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/examples/*.cpp")
  foreach(EXAMPLE_SOURCE ${EXAMPLE_SOURCES})
    get_filename_component(EXAMPLE_NAME ${EXAMPLE_SOURCE} NAME_WE)
    add_executable(${EXAMPLE_NAME} ${EXAMPLE_SOURCE})
    target_link_libraries(${EXAMPLE_NAME} vector)
    install(TARGETS ${EXAMPLE_NAME}
      RUNTIME DESTINATION bin
    )
  endforeach(EXAMPLE_SOURCE ${EXAMPLE_SOURCES})
endif()

install(TARGETS vector
    EXPORT vector-config
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
)

install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/include/ DESTINATION include)
install(EXPORT vector-config DESTINATION cmake)

if(BUILD_TESTS)
  enable_testing()
  file(GLOB ${PROJECT_NAME}_TEST_SOURCES tests/*.cpp)
  add_executable(check ${${PROJECT_NAME}_TEST_SOURCES})
  target_link_libraries(check ${PROJECT_NAME} ${DEPENDS_LIBRARIES})
  add_test(NAME check COMMAND check "-s" "-r" "compact" "--use-colour" "yes")
endif()

include(CPackConfig.cmake)