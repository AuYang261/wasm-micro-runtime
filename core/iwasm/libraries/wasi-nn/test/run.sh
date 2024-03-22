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

/opt/wasi-sdk/bin/clang \
    -Wl,--allow-undefined \
    -Wl,--strip-all,--no-entry \
    --sysroot=/opt/wasi-sdk/share/wasi-sysroot \
    -I../include -I../src/utils \
    -o bird.wasm \
    bird.c utils.c

cp test_tensorflow.wasm ~/ruxos/apps/c/wamr/rootfs
cp test_tensorflow_quantized.wasm ~/ruxos/apps/c/wamr/rootfs
cp bird.wasm ~/WasmEdge-WASINN-examples/tflite-birds_v1-image

./iwasm --env="TARGET=cpu" --dir=. test_tensorflow.wasm | grep "Tests: passed!"
./iwasm --env="TARGET=cpu" --dir=. test_tensorflow_quantized.wasm | grep "Tests: passed!"
