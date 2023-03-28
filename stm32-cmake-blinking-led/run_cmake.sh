#!/bin/bash
#sudo rm -r build/
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
ctest
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
ctest -v
TEST_RET=$?  
echo "Test has returned:"${TEST_RET}
if [ ${TEST_RET} == 0 ]
then
 echo "GTEST PASSED. Building and FLashing STM32F1xx board....."
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
 gh issue create -a "@me" -b "Gtest failed. Please check GPIO configuration." -title "GPIO Tests"
fi

