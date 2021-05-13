#!/bin/sh

# For C++
echo "For C++"
cd ./cpp

# Building C++ program
g++ -o app main.cpp -I/usr/local/include/opencv4 -lopencv_core -lopencv_dnn -lopencv_highgui -lopencv_imgcodecs

# Testing 
./app

echo "End C++ test"

# For Python
echo "For Python"
cd ../python

python3 main.py

echo "End Python test"