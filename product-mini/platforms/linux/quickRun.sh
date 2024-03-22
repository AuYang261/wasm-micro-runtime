mkdir -p build && cd build && \
    cmake .. -DCMAKE_C_COMPILER=x86_64-linux-musl-gcc -DCMAKE_CXX_COMPILER=x86_64-linux-musl-gcc -DCMAKE_AR=x86_64-linux-musl-ar -DCMAKE_RANLIB=x86_64-linux-musl-ranlib -DWAMR_BUILD_TARGET=X86_64 -DWAMR_DISABLE_HW_BOUND_CHECK=1 -DWAMR_DISABLE_WRITE_GS_BASE=1 -DWAMR_BUILD_WASI_NN=1 -DFLATBUFFERS_LOCALE_INDEPENDENT=1 \
        -DCMAKE_CXX_FLAGS="-D\"strtoll_l(s, e, b, l)=strtoll(s, e, b)\" -D\"strtoull_l(s, e, b, l)=strtoull(s, e, b)\"" && \
    make -j

