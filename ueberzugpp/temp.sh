#!/bin/bash
pkg upgrade
pkg install build-essential opencv range-v3 libvips git cmake libtbb libspdlog
git clone https://github.com/jstkdng/ueberzugpp.git
cd ueberzugpp
git apply -v << 'EOF'
--- a/CMakeLists.txt
+++ b/CMakeLists.txt
@@ -202,7 +202,6 @@ if(ENABLE_DBUS)
   list(APPEND UEBERZUG_SOURCES "src/util/dbus.cpp")
 endif()
 
-set(PROJECT_WARNINGS_CXX -Wall -Wextra -Wpedantic -Werror)
 
 target_compile_options(
   ueberzug PRIVATE $<$<CONFIG:Debug>:
EOF
mkdir build
cd build
export CXXFLAGS="-I$PREFIX/include/opencv4"
cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX
make install
