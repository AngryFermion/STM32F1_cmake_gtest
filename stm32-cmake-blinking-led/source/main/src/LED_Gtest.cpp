/*
 * MyFirstTest.cpp
 *
 *  Created on: Mar 23, 2023
 *      Author: vishnu
 */

#include </home/vishnu/stm_cmake_v3/stm32-cmake-blinking-led/source/main/inc/gtest/gtest.h>

TEST(MyFirstTestClass, ThisTestPasses)
{
  SUCCEED();
}

TEST(MyFirstTestClass, ThisTestAlsoPasses)
{
	int a = 4, b = 6;
	  int sum = a + b;
	  ASSERT_EQ(sum, 10);
}


