include(FetchContent)

FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/d49a6654845491fcb2c1d05ef20648c5b7bed783.zip
)
FetchContent_MakeAvailable(googletest)

add_executable(hello_test hello_test.cc)
target_link_libraries(hello_test GTest::gtest_main)
target_link_libraries(hello_test texa_lib)

include(GoogleTest)
gtest_discover_tests(hello_test)
