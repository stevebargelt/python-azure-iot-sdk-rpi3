# Python Azure IoT SDK for Raspberry Pi 3 - [![Build Status](https://travis-ci.org/stevebargelt/python-azure-iot-sdk-rpi3.svg?branch=master)](https://travis-ci.org/stevebargelt/python-azure-iot-sdk-rpi3)[![Docker Hub Pulls](https://img.shields.io/docker/pulls/stevebargelt/python-azure-iot-sdk-rpi3.svg)](https://hub.docker.com/r/stevebargelt/python-azure-iot-sdk-rpi3)

Twitter: [@stevebargelt](http://www.twitter.com/stevebargelt)

### Docker Run

```
docker run -it stevebargelt/python-azure-iot-sdk-rpi3
```

Once in container...

```
cd device/samples
python iothub_client_sample.py -c "<AZURE IOT HOSTNAME>" -p amqp
```
