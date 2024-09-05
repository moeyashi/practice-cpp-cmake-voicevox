# practice cpp cmake voicevox

## run

Dockerコンテナから音出すの難しかったので`./simple_tts`で作成されたaudio.wavをホスト側にコピーしたら再生できます。

```sh
cmake -S . -B build
cmake --build build
cp build/simple_tts ./
./simple_tts これはテストです
```
