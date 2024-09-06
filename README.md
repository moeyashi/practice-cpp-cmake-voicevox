# practice cpp cmake voicevox

## run

### in devcontainer

Dockerコンテナから音出すの難しかったので`./simple_tts`で作成されたaudio.wavをホスト側にコピーしたら再生できます。

```sh
binary=download-linux-x64
curl -sSfL https://github.com/VOICEVOX/voicevox_core/releases/latest/download/${binary} -o download
chmod +x download
./download
cmake -S . -B build
cmake --build build
cp build/simple_tts ./
./simple_tts これはテストです
```

### in host

```bash
docker build -t practice-cpp-cmake-voicevox .
docker run practice-cpp-cmake-voicevox
# docker cp などでaudio.wavをホスト側にコピーして再生
```
