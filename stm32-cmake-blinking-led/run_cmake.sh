#!/bin/bash
#sudo rm -r build/
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
#./init_led
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

