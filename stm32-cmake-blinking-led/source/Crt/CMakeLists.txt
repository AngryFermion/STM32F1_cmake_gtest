add_library(Crt INTERFACE)

target_sources(Crt
  INTERFACE
    startup.s
)

target_link_libraries(Crt
  INTERFACE
    irq
    "-T ${CMAKE_CURRENT_SOURCE_DIR}/linker.ld"
)

set_target_properties(Crt PROPERTIES
  #INTERFACE_LINK_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/linker_script.ld
  INTERFACE_LINK_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/linker.ld
)
