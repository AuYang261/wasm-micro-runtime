/opt/wasi-sdk/bin/clang \
    -Wl,--allow-undefined \
    -Wl,--strip-all,--no-entry \
    --sysroot=/opt/wasi-sdk/share/wasi-sysroot \
    -I../include -I../src/utils \
    -o test_tensorflow.wasm \
    test_tensorflow.c utils.c

/opt/wasi-sdk/bin/clang \
    -Wl,--allow-undefined \
    -Wl,--strip-all,--no-entry \
    --sysroot=/opt/wasi-sdk/share/wasi-sysroot \
    -I../include -I../src/utils \
    -o test_tensorflow_quantized.wasm \
    test_tensorflow_quantized.c utils.c

./iwasm --env="TARGET=cpu" --dir=. test_tensorflow.wasm | grep "Tests: passed!"
./iwasm --env="TARGET=cpu" --dir=. test_tensorflow_quantized.wasm | grep "Tests: passed!"
