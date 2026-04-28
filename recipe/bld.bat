@echo off
setlocal EnableDelayedExpansion

:: Configure 
cmake -B build -G "NMake Makefiles" -S %SRC_DIR% ^
         "%CMAKE_ARGS%" ^
         -DCMAKE_BUILD_TYPE=Release ^
         -DCMAKE_C_COMPILER=cl ^
         -DCMAKE_CXX_COMPILER=cl ^
         -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
         -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
         -DCMAKE_VERBOSE_MAKEFILE=ON ^
         -DUSE_SHARED_MBEDTLS_LIBRARY=ON ^
         -DENABLE_PROGRAMS=OFF ^
         -DENABLE_TESTING=OFF
if errorlevel 1 exit 1

cd build
:: Build and install
nmake
if errorlevel 1 exit 1
nmake install
if errorlevel 1 exit 1
