cmake_minimum_required(VERSION 3.28)
# プロジェクト名と使用する言語を設定
project(test_cmake CXX)

add_executable(simple_tts main.cpp)
set_property(TARGET simple_tts PROPERTY CXX_STANDARD 11)

file(GLOB ONNXRUNTIME_SHARED_LIB ./libonnxruntime.so.* ./libonnxruntime.*.dylib)
target_link_directories(simple_tts PRIVATE ./voicevox_core)


file(GLOB CORE_LIB ./voicevox_core/libvoicevox_core.so.* ./voicevox_core/libvoicevox_core.*.dylib)
target_link_libraries(simple_tts voicevox_core)