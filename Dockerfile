FROM resin/raspberrypi3-python:3.4

RUN \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y git cmake build-essential curl libcurl4-openssl-dev libssl-dev uuid-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

#Copy repo
RUN cd /usr/src/app && export GIT_SSL_NO_VERIFY=1 && \
    git config --global http.sslVerify false && \
    git clone --recursive https://github.com/Azure/azure-iot-sdk-python.git  .

RUN chmod +x build_all/linux/setup.sh
RUN chmod +x build_all/linux/build.sh
RUN cd /usr/src/app/build_all/linux

# Install App
RUN /usr/src/app/build_all/linux/setup.sh --python-version 3.4
RUN /usr/src/app/build_all/linux/build.sh --build-python 3.4

CMD bash