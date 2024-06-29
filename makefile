TARGET = application
CONFIG = Debug

all: build

build: configure
	@cmake --build build --config $(CONFIG) --target $(TARGET)

run: build
	@cmake -E chdir build/$(CONFIG) ./$(TARGET)

test: configure
	@cmake --build build --config Debug --target tests
	@cmake -E chdir build/Debug ./tests
	@cmake --build build --config Release --target tests
	@cmake -E chdir build/Release ./tests
	@cmake --build build --config RelWithDebInfo --target tests
	@cmake -E chdir build/RelWithDebInfo ./tests
	@cmake --build build --config MinSizeRel --target tests
	@cmake -E chdir build/MinSizeRel ./tests

benchmark: configure
	@cmake --build build --config Release --target benchmarks
	@cmake -E chdir build/Release ./benchmarks
	@cmake --build build --config RelWithDebInfo --target benchmarks
	@cmake -E chdir build/RelWithDebInfo ./benchmarks
	@cmake --build build --config MinSizeRel --target benchmarks
	@cmake -E chdir build/MinSizeRel ./benchmarks

install: configure
	@cmake --build build --config Release --target install

uninstall:
	@cmake -E remove_directory install

package: configure
	@cmake --build build --config Release --target package

configure: build/build.ninja

build/build.ninja: CMakeLists.txt
	@cmake -B build --preset default

clean:
	@cmake -E remove_directory build
