# Project settings
#option(TEXA_BUILD_EXECUTABLE "Build the project as an executable, rather than a library." ON)

# Compiler options
option(TEXA_WARNINGS_AS_ERRORS "Treat compiler warnings as errors." ON)

# Unit testing
option(TEXA_ENABLE_UNIT_TESTING "Enable unit tests for the projects (from the `test` subfolder)." ON)

# Static analyzers
option(TEXA_ENABLE_CLANG_TIDY "Enable static analysis with Clang-Tidy." ON)
option(TEXA_ENABLE_CPPCHECK "Enable static analysis with Cppcheck." ON)

# Code coverage
option(TEXA_ENABLE_CODE_COVERAGE "Enable code coverage through GCC." OFF)

# Generate compile_commands.json for clang based tools
option(TEXA_VERBOSE_OUTPUT "Enable verbose output, allowing for a better understanding of each step taken." ON)

option(TEXA_ENABLE_LTO "Enable Interprocedural Optimization, aka Link Time Optimization (LTO)." OFF)
if(TEXA_ENABLE_LTO)
  include(CheckIPOSupported)
  check_ipo_supported(RESULT result OUTPUT output)
  if(result)
    set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE)
  else()
    message(SEND_ERROR "IPO is not supported: ${output}.")
  endif()
endif()

option(TEXA_ENABLE_CCACHE "Enable the usage of Ccache, in order to speed up rebuild times." ON)
find_program(CCACHE_FOUND ccache)
if(CCACHE_FOUND)
  set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
  set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
endif()

option(TEXA_ENABLE_ASAN "Enable Address Sanitize to detect memory error." OFF)
if(TEXA_ENABLE_ASAN)
    add_compile_options(-fsanitize=address)
    add_link_options(-fsanitize=address)
endif()
