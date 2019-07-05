OBJS = ./dist/cimgui.o

CXXFLAGS=-Os -c --target=wasm32-unknown-wasi --sysroot sysroot -I./imgui

all:$(OBJS) sysroot dub
	@echo Build complete for spasm-imgui

webpack:
	cd spasm-imgui && npx webpack

move-docs:
	cd spasm-imgui && mv index.html ../docs && mv spasm-imgui ../docs/spasm-imgui.wasm

docs: all webpack move-docs

dub:
	cd spasm-imgui && dub build --build=release

./dist/cimgui.o:
	clang $(CXXFLAGS) ./cimgui/cimgui.cpp ./cimgui/imgui/imgui.cpp ./cimgui/imgui/imgui_draw.cpp ./cimgui/imgui/imgui_widgets.cpp ./cimgui/imgui/imgui_demo.cpp
	mv *.o dist/

sysroot:
	cd wasi-libc && make && mv sysroot ../

.PHONY: all dub
