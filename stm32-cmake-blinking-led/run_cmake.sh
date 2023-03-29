#!/bin/bash
#sudo rm -r build/

#rm -r build/
#mkdir build
#cd build/
#cmake ../
#cmake --build .
#cmake --build . --target stm32-flash
#cd ../
#cd ../
#rm -r build/
#pwd
#mkdir build
#cd build
#cmake ..
#cd ..
#cd build/testfiles/
#make
#cd ..
#cd ..

#cmake -S . -B build
#cmake --build build
#pwd
#cd build/
#cd gtest/
#make
#pwd
#ctest --output-on-failure
#TEST_RET=$?  
#echo "Test has returned:"${TEST_RET}



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
#TEST_RET=$?  
#echo "Test has returned:"${TEST_RET}
#if [ ${TEST_RET} == 0 ]
#then
 #echo "GTEST PASSED"
 #echo "Closing any issues that were open due to GPIO Gtest failures"
# pwd
 #cd ..
 #cd ..
 #cd Issues/
 #cd ..
 #cd ..
# cd ..
 ##Here: pwd
 #set -e
 #echo "Building and Flashing STM32F1xx board with code 12:41....."
 #rm -r build/
 #mkdir build
 #cd build/
 #cmake ../
 #cmake --build .
 #cmake --build . --target stm32-flash
 #echo "Flashining ended..."

