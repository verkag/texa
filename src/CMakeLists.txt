#set(Boost_USE_STATIC_LIBS OFF) 
#set(Boost_USE_MULTITHREADED ON)  
#set(Boost_USE_STATIC_RUNTIME OFF) 

find_package(Boost REQUIRED COMPONENTS system regex) # tested on version 1.85

if(Boost_FOUND)
    if(${PROJECT_NAME}_VERBOSE_OUTPUT)
        verbose_message("Found the following sources:")
        foreach(source IN LISTS sources)
        verbose_message("* ${source}")
        endforeach()
    endif()

    add_library(texa_lib SHARED ${sources})    
    
    target_include_directories(texa_lib PRIVATE ${Boost_INCLUDE_DIRS}) 
    target_link_libraries(texa_lib PRIVATE ${Boost_LIBRARIES})
    target_include_directories(texa_lib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
    
    add_executable(texa_bin main.cpp) 
    target_link_libraries(texa_bin texa_lib)
endif()


