#!/bin/bash

function run_docker_build(){
	# TODO - make this platform agnostic because Mac OSX defaults to python 2.x
	python3 uzumaki-docker-build.py
}

function pip_exists() {
	PIP=$(which pip)
	if [ -z $PIP ] 
	then
		echo "PIP is required for the build, please install pip with the following directions:"
		echo "https://pip.pypa.io/en/stable/installing/"
		return false
	else
		return true
	fi
}

if [ pip_exists ]
then
	echo "Starting Docker build for HDFS images"
	run_docker_build
else
	echo "PIP is not installed, cannot do build :("
	exit 1
fi