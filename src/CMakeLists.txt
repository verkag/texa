set(Boost_USE_STATIC_LIBS OFF) 
set(Boost_USE_MULTITHREADED ON)  
set(Boost_USE_STATIC_RUNTIME OFF) 
find_package(Boost REQUIRED COMPONENTS system regex) 

if(Boost_FOUND)
    include_directories(${Boost_INCLUDE_DIRS}) 
    include_directories(${CMAKE_SOURCE_DIR})

    file(GLOB SOURCES "*.cpp")

    add_executable(texa ${SOURCES}) 

    target_link_libraries(texa ${Boost_LIBRARIES})

    endif()


