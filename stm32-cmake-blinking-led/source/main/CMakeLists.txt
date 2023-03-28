include(Utils)
include(FindSTM32HAL)
add_executable(main)



target_sources(main
  PRIVATE
    src/main.c
    ${STM32HAL_SOURCES}
    ${STM32HAL_CMSIS_SOURCES}
    /home/vishnu/stm_cmake_v3/stm32-cmake-blinking-led/source/main/src/init_led.c
)



target_include_directories(main
  PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/inc
    ${CMAKE_CURRENT_SOURCE_DIR}/src
    ${STM32HAL_INCLUDE_DIRS}
    #/home/vishnu/tools/STM32CubeF1/Drivers/STM32F1xx_HAL_Driver/Inc
    #/home/vishnu/tools/STM32CubeF1/Core/Inc
    /home/vishnu/tools/STM32CubeF1/Drivers/CMSIS/Device/ST/STM32F1xx/Include
    /home/vishnu/tools/STM32CubeF1/Drivers/CMSIS/Core/Include
    
)

target_link_libraries(main
  PRIVATE
    Crt
    #startup
    #hal
    #trace
)



set_property(TARGET main PROPERTY LINK_INTERFACE_MULTIPLICITY 3)
set_property(TARGET main PROPERTY SUFFIX .elf)

stm32_target_size(main)
stm32_target_listing(main)
stm32_target_install(main)

link_compile_commands_file(main)

