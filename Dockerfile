FROM resin/raspberrypi3-debian:stretch

LABEL maintainer="steve@bargelt.com"

ENV INITSYSTEM=on

# Update image
SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y git cmake build-essential curl libcurl4-openssl-dev \
    libssl1.0-dev uuid-dev apt-utils python python-pip python-virtualenv python3 python3-pip python3-virtualenv \
    libboost-python-dev pkg-config valgrind

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

#Copy repo
RUN cd /usr/src/app && export GIT_SSL_NO_VERIFY=1 && \
    git config --global http.sslVerify false && \
    git clone --recursive https://github.com/Azure/azure-iot-sdk-python.git  .

RUN python3 -m virtualenv --python=python3.5 env35
RUN source env35/bin/activate && pip install --upgrade pip && pip install -U setuptools wheel

RUN chmod +x build_all/linux/build.sh

# Build for Python 3
RUN source env35/bin/activate && build_all/linux/release.sh --build-python 3.5

# Repeat for Python 2
RUN pip install -U setuptools wheel
RUN build_all/linux/release.sh
CMD bash