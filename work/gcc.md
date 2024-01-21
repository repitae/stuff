```
wget https://mirror.linux-ia64.org/gnu/gcc/releases/gcc-12.3.0/gcc-12.3.0.tar.gz
tar zxf gcc-12.3.0.tar.gz && cd gcc-12.3.0
./contrib/download_prerequisites
mkdir objdir && cd objdir
../configure --prefix=/app/gcc-12.3.0
[[ $? -eq 1 ]] && make -j$(nproc) && make install
```
```
wget https://mirror.linux-ia64.org/gnu/gcc/releases/gcc-13.2.0/gcc-13.2.0.tar.gz
tar zxf gcc-13.2.0.tar.gz && cd gcc-13.2.0
./contrib/download_prerequisites
mkdir objdir && cd objdir
../configure --prefix=/app/gcc-13.2.0
[[ $? -eq 1 ]] && make -j$(nproc) && make install
```
[[ -f /app/gcc-13.2.0/bin/gcc ]] && VERSION=gcc-13.2.0
[[ -f /app/gcc-12.3.0/bin/gcc ]] && VERSION=gcc-12.3.0
```
export PATH=/app/gcc-$VERSION/bin:$PATH
export LIBRARY_PATH=/app/$VERSION/lib64:$LIBRARY_PATH
export LD_LIBRARY_PATH=/app/$VERSION/lib64:$LD_LIBRARY_PATH
export C_INCLUDE_PATH=/app/$VERSION/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=/app/$VERSION/include:$CPLUS_INCLUDE_PA
```
/usr/local/bin/bazel --version
```
cd /app/src/
git clone https://github.com/envoyproxy/envoy envoy-gcc
cd envoy-gcc
bazel clean
#bazel clean --expunge
bazel/setup_clang.sh /app/src/llvm14
#bazel build envoy --config=libc++
bazel build envoy --config=clang
bazel build envoy --config=sizeopt
```
export CC=/app/gcc-12.3.0/
export CXX=/app/gcc-12.3.0/
```
CC=clang --host_action_env=CC=clang
CXX=clang++ --host_action_env=CXX=clang++
```
git checkout release/v1.29
bazel build envoy --config=sizeopt
bazel build envoy --config=sizeopt --strip=always
bazel build -c opt //source/exe:envoy-static
```