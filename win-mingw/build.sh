cd git-crypt
export PATH=/usr/lib/mxe/usr/bin:$PATH
export TARGET=x86_64-w64-mingw32.static
export MXE_PATH=/usr/lib/mxe/usr/$TARGET
export CXXFLAGS="-I$MXE_PATH/include -L$MXE_PATH/lib -static -static-libgcc -Wall -pedantic -Wno-long-long -O2"
export LDFLAGS=" -I$MXE_PATH/include -L$MXE_PATH/lib -lcrypto -lgdi32 -lz"

make LD=$TARGET-ld AR=$TARGET-ar CC=$TARGET-gcc CXX=$TARGET-g++ PKG_CONFIG=$TARGET-pkg-config MXE_TARGETS=$TARGET
