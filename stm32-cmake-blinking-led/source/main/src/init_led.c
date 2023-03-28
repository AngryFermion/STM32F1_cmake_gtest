#include "/home/vishnu/stm_cmake_v3/stm32-cmake-blinking-led/source/main/inc/main/led_init.h"
#include "/home/vishnu/stm_cmake_v3/stm32-cmake-blinking-led/source/main/inc/commons/testvalues.h"
#include "stdio.h"
#include <stdlib.h>
GPIO_InitTypeDef GPIO_InitStruct = {0};
int test_val[4] = {0};
int *init_led(){
/* GPIO Ports Clock Enable */
    #ifndef TESTING
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();
   #endif
  /*Configure GPIO pin Output Level */
  //HAL_GPIO_WritePin(LED_GPIO_Port, LED_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin : LED_Pin */
  GPIO_InitStruct.Pin = GPIO_PIN_1;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  #ifndef TESTING
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
  #endif
  #ifdef TESTING
  test_val[0] = GPIO_InitStruct.Pin;
  test_val[1] = GPIO_InitStruct.Mode;
  test_val[2] = GPIO_InitStruct.Pull;
  test_val[3] = GPIO_InitStruct.Speed;
  #endif
  GPIO_InitStruct.Pin = GPIO_PIN_4;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  #ifndef TESTING
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
  #endif
  #ifndef TESTING
  
  #endif
  #ifdef TESTING
  return test_val;
  #endif
  #ifndef TESTING
  return 0;
  #endif
}
