if(NOT STM32_CUBE)
    message(FATAL_ERROR "No STM32_CUBE specified")
endif()

if(NOT STM32_CHIP)
  message(FATAL_ERROR "No STM32_CHIP specified")
endif()

string(SUBSTRING ${STM32_CHIP} 5 2 CHIP_TYPE)
string(TOLOWER ${CHIP_TYPE} CHIP_TYPE_LOWER)

#if(CHIP_TYPE STREQUAL "F0")
if(CHIP_TYPE STREQUAL "F1")
#elseif(CHIP_TYPE STREQUAL "F1")
#elseif(CHIP_TYPE STREQUAL "F2")
#elseif(CHIP_TYPE STREQUAL "F3")
#elseif(CHIP_TYPE STREQUAL "F4")

#  set(HAL_COMPONENTS
#    adc can cec cortex crc cryp dac dcmi dma dma2d eth flash
#    flash_ramfunc fmpi2c gpio hash hcd i2c i2s irda iwdg ltdc
#    nand nor pccard pcd pwr qspi rcc rng rtc sai sd sdram
#    smartcard spdifrx spi sram tim uart usart wwdg
#  )

   set(HAL_COMPONENTS gpio rcc cortex pwr rtc msp)
   set(HAL_CMSIS_COMPONENTS system)


 # set(HAL_REQUIRED_COMPONENTS
 #   cortex pwr rcc
 # )

#  set(HAL_EX_COMPONENTS
  #  adc cryp dac dcmi dma flash fmpi2c hash i2c i2s pcd
  #  pwr rcc rtc sai tim
  #)

#  set(HAL_PREFIX stm32f4xx)
   set(HAL_PREFIX stm32f1xx)
   message("HAL_PREFIX and HAL_COMPONENTS configured successfully\n")
   message("HAL_PREFIX:\n"${HAL_PREFIX})
   message("HAL_COMPONENT:\n"${HAL_COMPONENTS})
#elseif(CHIP_TYPE STREQUAL "F7")
#elseif(CHIP_TYPE STREQUAL "L0")
#elseif(CHIP_TYPE STREQUAL "L1")

#  set(HAL_COMPONENTS
 #   adc comp cortex crc cryp dac dma flash flash_ramfunc
  #  gpio i2c i2s irda iwdg lcd nor opamp pcd pwr rcc rtc
  #  sd smartcard spi sram tim uart usart wwdg
  #)

  #set(HAL_REQUIRED_COMPONENTS
  #  cortex pwr rcc
 # )

  #set(HAL_EX_COMPONENTS
  #  adc cryp dac flash opamp pcd pwr rcc rtc tim
  #)

  #SET(HAL_PREFIX stm32l1xx)

# elseif(CHIP_TYPE STREQUAL "L4")

  #set(HAL_COMPONENTS
   # adc can comp cortex crc cryp dac dcmi dfsdm dma dma2d
   # dsi exti firewall flash flash_ramfunc gfxmmu
   # gpio hash hcd i2c irda iwdg lcd lptim ltdc mmc nand
   # nor opamp ospi pcd pka pssi pwr qspi rcc rng rtc sai
   # sd smartcard smbus spi sram swpmi tim uart usart wwdg 
  #)

  #set(HAL_REQUIRED_COMPONENTS
  #  cortex pwr rcc
  #)

  #set(HAL_EX_COMPONENTS
  #  adc crc cryp dac dfsdm dma flash hash
  #  ltdc mmc opamp pcd pwr rcc rng rtc sai
   # sd smartcard spi tim uart usart
  #)

  #SET(HAL_PREFIX stm32l4xx)

endif()

set(HAL_HEADERS
  ${HAL_PREFIX}_hal.h
  ${HAL_PREFIX}_hal_def.h
  ${HAL_PREFIX}_hal_conf.h
  ${HAL_PREFIX}_hal_it.h
)
message("HAL_HEADERS are confugured\n")
message("HAL_HEADERS\n"${HAL_HEADERS})

set(HAL_SOURCES
  ${HAL_PREFIX}_hal.c
)
foreach(component ${HAL_COMPONENTS})
list(APPEND HAL_SOURCES
  ${HAL_PREFIX}_hal_${component}.c
)
endforeach()
message("HAL_SOURCES set as:\n"${HAL_SOURCES})
foreach(cmsis_component ${HAL_CMSIS_COMPONENTS})
list(APPEND HAL_CMSIS_SOURCES
  ${cmsis_component}_${HAL_PREFIX}.c
)
endforeach()
message("HAL_SOURCES set as:\n"${HAL_CMSIS_SOURCES})
if(NOT STM32HAL_FIND_COMPONENTS)
  set(STM32HAL_FIND_COMPONENTS ${HAL_COMPONENTS})
endif()

#foreach(component ${HAL_REQUIRED_COMPONENTS})
#  list(FIND STM32HAL_FIND_COMPONENTS ${component} FOUND_INDEX)
#  if(${FOUND_INDEX} LESS 0)
#    list(APPEND STM32HAL_FIND_COMPONENTS ${component})
#  endif()
#endforeach()

#foreach(component ${STM32HAL_FIND_COMPONENTS})
#  list(FIND HAL_COMPONENTS ${component} FOUND_INDEX)
#  if(${FOUND_INDEX} LESS 0)
#    message(FATAL_ERROR "Unknown STM32HAL component: ${component}. Available components: ${HAL_COMPONENTS}")
#  else()
#    list(APPEND HAL_HEADERS ${HAL_PREFIX}_hal_${component}.h)
#    list(APPEND HAL_SOURCES ${HAL_PREFIX}_hal_${component}.c)
#  endif()
#  list(FIND HAL_EX_COMPONENTS ${component} FOUND_INDEX)
#  if(NOT (${FOUND_INDEX} LESS 0))
#    list(APPEND HAL_HEADERS ${HAL_PREFIX}_hal_${component}_ex.h)
#    list(APPEND HAL_SOURCES ${HAL_PREFIX}_hal_${component}_ex.c)
#  endif()
#endforeach()

#list(REMOVE_DUPLICATES HAL_HEADERS)
#list(REMOVE_DUPLICATES HAL_SOURCES)
message("Appending HAL_SOURCE Include directories....\n")
find_path(STM32HAL_INCLUDE_DIR ${HAL_HEADERS}
  PATH_SUFFIXES include stm32${CHIP_TYPE_LOWER}
  HINTS ${STM32_CUBE}/Drivers/STM32${CHIP_TYPE}xx_HAL_Driver/Inc
  CMAKE_FIND_ROOT_PATH_BOTH
)

list(APPEND STM32HAL_INCLUDE_DIRS ${STM32HAL_INCLUDE_DIR})


find_path(STM32HAL_INCLUDE_CORE_DIR ${HAL_HEADERS}
  PATH_SUFFIXES include stm32${CHIP_TYPE_LOWER}
  HINTS ${STM32_CUBE}/Core/Inc
  CMAKE_FIND_ROOT_PATH_BOTH
)

list(APPEND STM32HAL_INCLUDE_DIRS ${STM32HAL_INCLUDE_CORE_DIR})
message("HAL INCLUDE Directories?:\n"${STM32HAL_INCLUDE_DIRS}) 
message("Appending HAL_SOURCE directories....\n")
foreach(file ${HAL_SOURCES})
  message("file name:\n"${file})
  find_file(HAL_SOURCE ${file}
      PATH_SUFFIXES src stm32${CHIP_TYPE_LOWER}
      HINTS ${STM32_CUBE}/Drivers/STM32${CHIP_TYPE}xx_HAL_Driver/Src
      CMAKE_FIND_ROOT_PATH_BOTH
    )
  list(APPEND STM32HAL_SOURCES ${HAL_SOURCE})
  message("HAL_SOURCE directory?:"${STM32HAL_SOURCES})
  unset(HAL_SOURCE CACHE)
endforeach()

foreach(cmsis_file ${HAL_CMSIS_SOURCES})
  message("file name:\n"${cmsis_file})
  find_file(HAL_CMSIS_SOURCE ${cmsis_file}
      PATH_SUFFIXES src stm32${CHIP_TYPE_LOWER}
      HINTS ${STM32_CUBE}/Drivers/CMSIS/Device/ST/STM32${CHIP_TYPE}xx/Source/Templates
      CMAKE_FIND_ROOT_PATH_BOTH
    )
  list(APPEND STM32HAL_CMSIS_SOURCES ${HAL_CMSIS_SOURCE})
  message("HAL_CMSIS_SOURCE directory?:"${STM32HAL_CMSIS_SOURCES})
  unset(HAL_SOURCE CACHE)
endforeach()


include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(STM32HAL DEFAULT_MSG STM32HAL_INCLUDE_DIRS STM32HAL_SOURCES)
