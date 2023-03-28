/*
 * MyFirstTest.cpp
 *
 *  Created on: Mar 23, 2023
 *      Author: vishnu
 */

#include </usr/local/include/gtest/gtest.h>

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


