FROM ubuntu:16.04

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update
# install build essentials
RUN apt-get install -y build-essential cmake pkg-config

# install opencv and numpy
RUN apt-get install -y libopencv-dev python-opencv
RUN apt-get install -y libboost-all-dev --fix-missing

# install python dlib
RUN apt-get install -y python-setuptools python-dev
RUN easy_install dlib

RUN mkdir -p /data
COPY *.dat /data

RUN mkdir -p /workspace
RUN mkdir -p /images
WORKDIR /workspace
COPY faceswap.py /workspace/

RUN chmod +x faceswap.py

