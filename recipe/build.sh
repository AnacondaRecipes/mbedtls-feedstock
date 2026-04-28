#!/bin/sh

mkdir build

if [[ "$target_platform" == osx-arm64 ]]; then
	cmake -B build -S ${SRC_DIR} \
		${CMAKE_ARGS} \
		-DCMAKE_INSTALL_PREFIX=$PREFIX \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_VERBOSE_MAKEFILE=ON \
		-DUSE_SHARED_MBEDTLS_LIBRARY=ON \
		-DENABLE_PROGRAMS=OFF \
		-DENABLE_TESTING=OFF
else	
 	cmake -B build -S ${SRC_DIR} \
		${CMAKE_ARGS} \
		-DCMAKE_INSTALL_PREFIX=$PREFIX \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_VERBOSE_MAKEFILE=ON \
		-DUSE_SHARED_MBEDTLS_LIBRARY=ON \
		-DENABLE_PROGRAMS=OFF \
		-DENABLE_TESTING=OFF \
		-DCMAKE_C_FLAGS="-Wno-stringop-overflow" \
    	-DCMAKE_CXX_FLAGS="-Wno-stringop-overflow"
fi

cmake --build build
cmake --install build
