FROM ubuntu:24.04 AS dev

WORKDIR /workspaces/practice-cpp-cmake-voicevox

RUN apt-get update \
  && apt-get install -y \
  curl \
  git \
  gnupg \
  g++ \
  cmake

FROM dev AS build

WORKDIR /app

RUN binary=download-linux-x64 \
  && curl -sSfL https://github.com/VOICEVOX/voicevox_core/releases/latest/download/${binary} -o download \
  && chmod +x download \
  && ./download

COPY ./CMakeLists.txt /app/CMakeLists.txt
COPY ./main.cpp /app/main.cpp

RUN cmake -S . -B build \
  && cmake --build build

FROM ubuntu:24.04 AS prod

COPY --from=build /app/voicevox_core /app/voicevox_core
COPY --from=build /app/build/simple_tts /app/simple_tts

WORKDIR /app

ENTRYPOINT ["./simple_tts"]

CMD ["これはテストです"]
