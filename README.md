# OpenCV with DNN CUDA support for YOLO

Adriano Santos.


## INTRODUCTION

This repository address to install the OpenCV with DNN and CUDA support to launch the YOLO models. You can use it as you want. You may add the weights (Darknet format) and the config file (cfg file) into the models folder.


## PLATFORM & BENCHMARK

- [x] ubuntu 18.04
- [ ] L4T (Jetson platform)

<details><summary><b>BENCHMARK</b></summary>

#### x86 (inference time)

##### C++

|  model  |  size   |  gpu   | fp32/fps | fp16/fps | INT8/fps |
| :-----: | :-----: | :----: | :--: | :--: | :--: |
| yolovV3 | 416x416 | 1080ti | 17ms/58.82  |  8ms/125   | /  |

##### Python

|  model  |  size   |  gpu   | fp32/fps | fp16/fps | INT8/fps |
| :-----: | :-----: | :----: | :--: | :--: | :--: |
| yolovV3 | 416x416 | 1080ti | 17.97ms/55.64  |  9.14ms/109.37   | /  |


#### Jetson NX with Jetpack4.4.1 (inference / detect time)

|      model      |      size      |  gpu   | fp32 | fp16 | INT8 |
| :-------------: | :----: | :--: | :--: | :--: | :--: |
| yolov3 | 416x416 |  |  |    | |

</details>

## DEVELOP ENV.

### For Visual Studio Code

You must install the ext called Remote containers (ext install ms-vscode-remote.remote-containers).

Add the "runArgs": ["--runtime=nvidia"] to devcontainer.json.

## REFERENCE

- https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers
- https://github.com/wang-xinyu/tensorrtx/tree/master/yolov4
- https://github.com/mj8ac/trt-yolo-app_win64
- https://github.com/NVIDIA-AI-IOT/deepstream_reference_apps
