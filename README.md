# OpenCV with DNN CUDA support for YOLO

Adriano Santos.


## INTRODUCTION

This repository address to install the OpenCV with DNN and CUDA support to launch the YOLO models. You can use it as you want. You must add the weights (Darknet format) and the config file (cfg file) into the models folder.


## PLATFORM & BENCHMARK

- [x] ubuntu 18.04
- [ ] L4T (Jetson platform)

<details><summary><b>BENCHMARK</b></summary>

#### x86 (inference time)

##### C++

|  model  |  size   |  gpu   | fp32 - inf.time | fp16 - inf.time | INT8 - inf.time |
| :-----: | :-----: | :----: | :--: | :--: | :--: |
| yolovV3 | 416x416 | RX 2070 | 58.82 - 17ms  |  125 - 8ms   | /  |

##### Python

|  model  |  size   |  gpu   | fp32 - inf.time | fp16 - inf.time | INT8 - inf.time |
| :-----: | :-----: | :----: | :--: | :--: | :--: |
| yolovV3 | 416x416 | RX 2070 | 55.89 - 17.89ms  |  109.46 - 9.13ms   | /  |


#### Jetson NX

|  model  |  size   |  gpu   | fp32 - inf.time | fp16 - inf.time | INT8 - inf.time |
| :-----: | :-----: | :----: | :--: | :--: | :--: |
| yolovV3 | 416x416 | RX 2070 | 7.19 - 139ms  |  17.24 - 58ms   | /  |

##### Python

|  model  |  size   |  gpu   | fp32 - inf.time | fp16 - inf.time | INT8 - inf.time |
| :-----: | :-----: | :----: | :--: | :--: | :--: |
| yolovV3 | 416x416 | RX 2070 | 7.14 - 139.95ms  |  16.96 - 58.96   | /  |

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
