#!/bin/bash

set -e
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
ctest --output-on-failure
TEST_RET=$? 
echo "WE ARE IN THE DIRECTORY:"
pwd
if [ ${TEST_RET} == 0 ]
then
 cd ..
 cd ..
 cd stm32-cmake-blinking-led/
 pwd
 #set -e
 echo "Building and Flashing STM32F1xx board with code 12:41....."
 rm -r build/
 mkdir build
 cd build/
 cmake ../
 cmake --build .
 cmake --build . --target stm32-flash
 echo "Flashining ended..."
fi
