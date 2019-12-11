FROM alpine:3.10

#
# Create the image: $ docker image build -t hello-webpy . 
# Use the image:    $ docker run -d --name="hello-webpy" -p 127.0.0.1:9090:9090 hello-webpy 
#

LABEL version="nalonso"
LABEL maintainer="MSc. Eng. Nestor Alonso Torres <nalonso@engineer.com>"

EXPOSE 9090

RUN apk add --no-cache uwsgi-python3 python3 && \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    pip3 install web.py

COPY ./resources/entrypoint /run
COPY ./resources/hello.py /opt
RUN chmod +x /run/entrypoint
ENTRYPOINT /run/entrypoint