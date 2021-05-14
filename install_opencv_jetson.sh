#!/bin/sh
apt-get update
apt-get clean
apt update && apt install -y cmake g++ wget unzip

# Download and unpack sources
wget -O opencv.zip https://github.com/opencv/opencv/archive/master.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/master.zip
unzip opencv.zip
unzip opencv_contrib.zip

# Create build directory and switch into it
mkdir -p build && cd build

# Configure
cmake -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib-master/modules \
    -D OPENCV_DNN_CUDA=ON \
    -D WITH_CUDNN=ON \
    -D WITH_CUDA=ON \
    -D ENABLE_FAST_MATH=1 \
    -D CUDA_FAST_MATH=1 \
    -D WITH_CUBLAS=1 \
    -D OPENCV_ENABLE_NONFREE=ON \
    -D WITH_NVCUVID=ON \
    -D CUDA_ARCH_BIN="5.3 6.2 7.2" \
    ../opencv-master

# Build
cmake --build .

make all -j$(nproc)
make install
ldconfig

rm ./opencv.zip ./opencv_contrib.zip
rm -rd ./opencv-master
rm -rd ./opencv_contrib-master

exit 0