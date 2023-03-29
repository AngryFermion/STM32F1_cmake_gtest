#include "/home/Ancit/Git_STM_cmake_gtest/STM32F1_cmake_gtest/stm32-cmake-blinking-led/source/main/src/init_led.c"
#include <gtest/gtest.h>
#include <stdio.h>
#include <stdint.h>


#define STM32F103xB

  
// Demonstrate some basic assertions.


int *gpio_test;

TEST(HelloTest, BasicAssertions) {
  // Expect two strings not to be equal.
  gpio_test = init_led();
  printf("Pin_number:%d",gpio_test[0]);
  EXPECT_EQ(gpio_test[0], GPIO_PIN_5);
  EXPECT_EQ(gpio_test[1], GPIO_MODE_OUTPUT_PP);
  EXPECT_EQ(gpio_test[2], GPIO_NOPULL);
  EXPECT_EQ(gpio_test[3], GPIO_SPEED_FREQ_LOW);
	
}
int main(int argc, char **argv) {
	 
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
