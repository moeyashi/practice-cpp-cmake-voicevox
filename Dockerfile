FROM ubuntu:24.04

RUN apt-get update \
  && apt-get install -y \
  curl \
  git \
  gnupg \
  g++ \
  cmake \
  && binary=download-linux-x64 \
  && curl -sSfL https://github.com/VOICEVOX/voicevox_core/releases/latest/download/${binary} -o download \
  && chmod +x download \
  && ./download

WORKDIR /app
