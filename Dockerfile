FROM ubuntu:18.10

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    graphviz \
    libhdf5-serial-dev \
    liblapack-dev \
    libopenblas-dev \
    pkg-config \
    python-dev \
    python-h5py \
    python-matplotlib \
    python-numpy \
    python-opencv \
    python-pip \
    python-scipy \
    unzip
RUN pip install pydot-ng
