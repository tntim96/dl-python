FROM ubuntu:18.10

ENV CUDA_RUN https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda_10.1.105_418.39_linux.run

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

RUN cd /opt && \
  wget $CUDA_RUN && \
  chmod +x *.run && \
  mkdir nvidia_installers && \
  ./cuda_10.1.105_418.39_linux.run -extract=`pwd`/nvidia_installers && \
  cd nvidia_installers && \
  ./NVIDIA-Linux-x86_64-340.29.run -s -N --no-kernel-module && \
  ./cuda-linux64-rel-6.5.14-18749181.run -noprompt

# Ensure the CUDA libs and binaries are in the correct environment variables
ENV LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-6.5/lib64
ENV PATH=$PATH:/usr/local/cuda-6.5/bin
