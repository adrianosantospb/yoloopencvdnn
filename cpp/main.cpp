#include <iostream>
#include <string>
#include <ctime>
#include <chrono>

#include "opencv2/imgproc.hpp"
#include "opencv2/highgui.hpp"
#include "opencv2/core.hpp"
#include "opencv2/dnn.hpp"

int main()
{
	// Configuration
	double confidenceThreshold = 0.5;
	double NMSThreshold = 0.4;
	int numClasses = 80;

	std::string weightsFile = "../yolos/yolov3.weights";
	std::string configFile = "../yolos/yolov3.cfg";
	std::string imageFile = "../yolos/dog.jpg";
	
	// Model loading
	auto net = cv::dnn::readNet(weightsFile, configFile);
	net.setPreferableBackend(cv::dnn::DNN_BACKEND_CUDA);
	net.setPreferableTarget(cv::dnn::DNN_TARGET_CUDA); //# if you want test FP16, you must change it for DNN_TARGET_CUDA_FP16

	cv::Mat image = cv::imread(imageFile);
	cv::Mat blob = cv::dnn::blobFromImage(image, 0.00392, cv::Size(416, 416), cv::Scalar(), true, false, CV_32F);
	auto outputNames = net.getUnconnectedOutLayersNames();
	std::vector<cv::Mat> detections;

	// Inf
	for(int i = 0; i < 3; i++)
	{
		net.setInput(blob);
		net.forward(detections, outputNames);
	}

	// Benckmark 
	auto start = std::chrono::steady_clock::now();
	for(int i = 0; i < 100; i++)
	{
		net.setInput(blob);
		net.forward(detections, outputNames);
	}
	auto end = std::chrono::steady_clock::now();

	// Print benckmark output
	std::chrono::milliseconds t = std::chrono::duration_cast<std::chrono::milliseconds>((end - start) / 100.0);
	std::cout << "Time per inference: " << t.count() << " ms" << std::endl
		<< "FPS: " << 1000.0 / (t.count()) << std::endl;

	return 0;
}
