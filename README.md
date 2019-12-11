# Webpy Hello World Docker Image

> Docker image with Hello World example in Webpy

&nbsp;

This is the simplest deployment of webpy in Docker. It uses the included development server, so it is not intended to be used in production.

This is just an easy way to get web.py up and running in a few seconds!

&nbsp;

---

## Table of Contents

- [Installation](#installation)
- [Features](#features)
- [License](#license)

## Installation

- Clone this repo to your local machine

```shell
```

- Build the Docker image:

```shell
$ docker image build -t hello-webpy .
Sending build context to Docker daemon  60.93kB
Step 1/9 : FROM alpine:3.10
 ---> 961769676411
Step 2/9 : LABEL version="nalonso"
 ---> Using cache
 ---> 581e154ae662
Step 3/9 : LABEL maintainer="MSc. Eng. Nestor Alonso Torres <nalonso@engineer.com>"
 ---> Using cache
 ---> fc71c03fd508
Step 4/9 : EXPOSE 9090
 ---> Using cache
 ---> 03e9ba197b44
Step 5/9 : RUN apk add --no-cache uwsgi-python3 python3 &&     if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi &&     python3 -m ensurepip &&     rm -r /usr/lib/python*/ensurepip &&     pip3 install --no-cache --upgrade pip setuptools wheel &&     if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi &&     pip3 install web.py
 ---> Using cache
 ---> 20a39f4aec80
Step 6/9 : COPY ./resources/entrypoint /run
 ---> Using cache
 ---> b390546bafc0
Step 7/9 : COPY ./resources/hello.py /opt
 ---> Using cache
 ---> 62981c362c98
Step 8/9 : RUN chmod +x /run/entrypoint
 ---> Using cache
 ---> 34324196547c
Step 9/9 : ENTRYPOINT /run/entrypoint
 ---> Using cache
 ---> 789e02c6c737
Successfully built 789e02c6c737
Successfully tagged hello-webpy:latest

```

- Run the container:

```shell
$ docker run -d --name="hello-webpy" -p 127.0.0.1:9090:9090 hello-webpy
47c6e967b7327c3373f0208be5651a90c4cb4f5ef3f77251cff26d9e92c32749
```

- Visit the site in your browser

> http://localhost:9090

- Try it with your name!

> http://localhost:9090/John

## License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
- Copyright 2019 © MSc. Eng. Nestor Alonso Torres.
