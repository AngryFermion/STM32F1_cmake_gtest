cmake_minimum_required(VERSION 3.14)

# GoogleTest requires at least C++14
set(CMAKE_CXX_STANDARD 14)
set(STM32_CHIP "STM32F103xB" CACHE STRING "")


#add_executable(init_led /home/vishnu/stm_cmake_v3/stm32-cmake-blinking-led/source/main/src/init_led.c)
#execute_process(COMMAND "exit")
include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
)
# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

enable_testing()
set(STM32_CHIP "STM32F103xB" CACHE STRING "")
add_executable(
  hello_test
 )
 target_sources(hello_test
 PRIVATE
 
 hello_test.cc
  )
add_definitions(-DTESTING)

target_include_directories(hello_test
  PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/inc
    ${CMAKE_CURRENT_SOURCE_DIR}/src
    ${STM32HAL_INCLUDE_DIRS}
    /home/vishnu/stm_cmake_v3/stm32-cmake-blinking-led/source/main/inc/main/led_init.h
    /home/vishnu/tools/STM32CubeF1/Drivers/STM32F1xx_HAL_Driver/Inc
    /home/vishnu/tools/STM32CubeF1/Core/Inc
    /home/vishnu/tools/STM32CubeF1/Drivers/CMSIS/Device/ST/STM32F1xx/Include
    /home/vishnu/tools/STM32CubeF1/Drivers/CMSIS/Core/Include
    
)


message("Directores:",${STM32HAL_INCLUDE_DIRS})

target_link_libraries(
  hello_test
  GTest::gtest
  #init_led
)
include(GoogleTest)
gtest_discover_tests(hello_test)
