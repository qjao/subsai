# syntax=docker/dockerfile:1

FROM --platform=linux/amd64 ubuntu:20.04
FROM nvidia/cuda:11.7.0-base-ubuntu20.04

ENV TZ="London/Europe"
ENV DEBIAN_FRONTEND="noninteractive"
ENV NVIDIA_DRIVER_CAPABILITIES="compute,video,utility"

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    ffmpeg \
    python3-dev \
    python3-pip \
    build-essential \
    git && \
  pip install git+https://github.com/qjao/subsai && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/*

CMD ["subsai-webui"]

EXPOSE 8501