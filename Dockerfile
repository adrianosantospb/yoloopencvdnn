FROM nvcr.io/nvidia/tensorrt:20.12-py3

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /home/yoloopencvdnn

# install prerequisites
RUN apt-get update && apt-get install -y --no-install-recommends \
	protobuf-compiler \
	geany \
	libprotoc-dev \
	python3-tk \
	eog \
	gedit \
	build-essential \
	cmake \
	git \
	wget \
	unzip \
	yasm \
	pkg-config \
	libswscale-dev \
	libtbb2 \
	libtbb-dev \
	libjpeg-dev \
	libpng-dev \
	libtiff-dev \
	libavformat-dev \
	libpq-dev \
	libgtk2.0-dev \
	python3-pip \
	&& rm -rf /var/lib/apt/lists/*

COPY . .
RUN bash install_opencv.sh