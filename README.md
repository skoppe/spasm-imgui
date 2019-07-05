# Wasm Imgui for D (experimental)

This repo contains a WebAssembly build of imgui (C++) and cimgui (C bindings), together with a webgl backend written in D. See [live demo](https://skoppe.github.io/spasm-imgui/).

The WebAssembly build of imgui and cimgui is done with clang and [WASI](https://wasi.dev/) as libc. This is linked with a D program that uses web bindings from [spasm](https://github.com/skoppe/spasm) to create a WebGL backend and render it to a canvas.

The cimgui D bindings are taken from [derelict dimgui](https://github.com/Extrawurst/DerelictImgui) and are partially upgraded to 1.71

# Experimental

I have only implemented the Bare Minimum (tm), some feature in the demo window don't work (e.g. filesystem, keyboard, right-click, etc.)

# Building yourself

Although imgui, cimgui and WASI are already precompiled (WebAssembly is portable), you can remove the dist and the sysroot folder and run `make`. Make sure to install the following dependencies first: clang llvm ldc dub lld grep diffutils make.

Currently the D part won't compile as it depends on two small patches for `spasm` and `optional`. I hope to make a PR for both soon.
