add_test( HelloTest.BasicAssertions /home/Ancit/Git_STM_cmake_gtest/STM32F1_cmake_gtest/build/gtest/hello_test [==[--gtest_filter=HelloTest.BasicAssertions]==] --gtest_also_run_disabled_tests)
set_tests_properties( HelloTest.BasicAssertions PROPERTIES WORKING_DIRECTORY /home/Ancit/Git_STM_cmake_gtest/STM32F1_cmake_gtest/build/gtest)
set( hello_test_TESTS HelloTest.BasicAssertions)
