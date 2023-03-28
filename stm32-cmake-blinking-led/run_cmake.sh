#!/bin/bash
#sudo rm -r build/
ISS_NUM=13
<<comment

rm -r build/
mkdir build
cd build/
cmake ../
cmake --build .
cmake --build . --target stm32-flash
cd ../
cd ../
rm -r build/
pwd
mkdir build
cd build
cmake ..
cd ..
cd build/testfiles/
make
cd ..
cd ..

cmake -S . -B build
cmake --build build
pwd
cd build/
cd gtest/
make
pwd
ctest --output-on-failure
TEST_RET=$?  
echo "Test has returned:"${TEST_RET}
comment
cd ..
rm -r build/
pwd
mkdir build
cd build
cmake ..
cd ..
cd build/testfiles/
make
cd ..
cd ..

cmake -S . -B build
cmake --build build
pwd
cd build/
cd gtest/
make
pwd
ctest --output-on-failure
TEST_RET=$?  
echo "Test has returned:"${TEST_RET}
if [ ${TEST_RET} == 0 ]
then
 echo "GTEST PASSED"
 echo "Closing any issues that were open due to GPIO Gtest failures"
 pwd
 
 
 #ISS_NUM= $(awk '{print $1}' issue_text.tx)
 cd ..
 cd ..
 cd /home/Ancit/Git_STM_cmake_gtest/STM32F1_cmake_gtest/stm32-cmake-blinking-led
 gh issue close 13
 echo "Building and FLashing STM32F1xx board....."
 cd ..
 cd ..
 cd stm32-cmake-blinking-led/
 rm -r build/
 mkdir build
 cd build/
 cmake ../
 cmake --build .
 cmake --build . --target stm32-flash
else
 echo "GTEST NOT PASSED..."
 echo "CREATING AN ISSUE ON GIT REPOSITORY"
 gh issue create -a "@me" -b "Gtest failed. Please check GPIO configuration." -t "GPIO Tests"
 ISS_NUM=${ISS_NUM} + 1
 gh issue list > ../../Issues/issue_text.tx
fi

