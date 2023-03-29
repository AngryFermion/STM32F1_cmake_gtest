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



#cd ..
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
 pwd
 set -e
# cd STM32F1_cmake_gtest/
 #git config --global --add safe.directory /var/lib/jenkins/STM32F1_cmake_gtest
 echo "Building and Flashing STM32F1xx board with code 12:41....."
 #cd ..
 #cd ..
 #cd stm32-cmake-blinking-led/
 rm -r build/
 mkdir build
 cd build/
 cmake ../
 BUILD_RET=$(cmake --build .)
 echo "build return:"${BUILD_RET}
 cmake --build . --target stm32-flash
 exit 0
 echo "Flashining ended..."
#else
# echo "GTEST NOT PASSED..."
# echo "CREATING AN ISSUE ON GIT REPOSITORY"
 #gh issue create -a "@me" -b "Gtest failed. Please check GPIO configuration." -t "GPIO Tests"
 #ISS_NUM=${ISS_NUM} + 1
 #gh issue list > ../../Issues/issue_text.tx
#fi
