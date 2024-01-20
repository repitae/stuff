```
cd /app/src/
sudo apt install bison # deps
```
```
curl -OL https://ftp.gnu.org/gnu/glibc/glibc-2.32.tar.gz
tar xzf ./glibc-2.32.tar.gz
cd glibc-2.32
mkdir build && cd build
[[ $? -eq 0 ]] && ../configure --prefix=/app/glibc-2.32
[[ $? -eq 0 ]] && make -j$(nproc)
[[ $? -eq 0 ]] && make install
```
```
cd /app/src/
curl -OL https://ftp.gnu.org/gnu/glibc/glibc-2.31.tar.gz
tar xzf ./glibc-2.31.tar.gz
cd glibc-2.31
mkdir build && cd build
[[ $? -eq 0 ]] && ../configure --prefix=/app/glibc-2.31
[[ $? -eq 0 ]] && make -j$(nproc) && make install
```
```
cd /app/src/
curl -OL https://ftp.gnu.org/gnu/glibc/glibc-2.30.tar.gz
tar xzf ./glibc-2.30.tar.gz
cd glibc-2.30
mkdir build && cd build
[[ $? -eq 0 ]] && ../configure --prefix=/app/glibc-2.30
[[ $? -eq 0 ]] && make -j$(nproc) && make install
```
```
cd /app/src/
curl -OL https://ftp.gnu.org/gnu/glibc/glibc-2.29.tar.gz
tar xzf ./glibc-2.29.tar.gz
cd glibc-2.29
mkdir build && cd build
[[ $? -eq 0 ]] && ../configure --prefix=/app/glibc-2.29
[[ $? -eq 0 ]] && make -j$(nproc)
[[ $? -eq 0 ]] && make install
```
```
cd /app/src/
mkdir -p /app/envoy129-bin
cd /app/envoy129-bin
wget https://github.com/envoyproxy/envoy/releases/download/v1.29.0/envoy-1.29.0-linux-x86_64
wget https://github.com/envoyproxy/envoy/releases/download/v1.29.0/envoy-contrib-1.29.0-linux-x86_64
mv envoy-1.29.0-linux-x86_64 envoy-bin
mv envoy-contrib-1.29.0-linux-x86_64 envoy-con
```
```
echo $LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/app/glibc-2.31/lib
LD_LIBRARY_PATH=/app/glibc-2.31/lib /app/envoy129b/envoy
LD_PRELOAD=/app/glibc-2.31/lib /app/envoy129b/envoy
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/app/glibc-2.29/lib ldd /app/envoy129b/envoy
LD_PRELOAD=/app/glibc-2.32/lib/libpthread.so.0:/app/glibc-2.32/lib/libm.so.6:/app/glibc-2.32/lib/libc.so.6 /app/envoy129b/envoy
ldd /app/envoy129b/envoy
```
```
### CRITICAL ###
#sudo cp /app/glibc-2.32/lib/libm-2.32.so /usr/local/lib/libm.so.6
#sudo cp /app/glibc-2.32/lib/libpthread.so.0 /usr/local/lib/libpthread.so.0
#sudo mv /lib/x86_64-linux-gnu/libm.so.6 /lib/x86_64-linux-gnu/libm.so.6.bak
#sudo ln -s /usr/local/lib/libm.so.6 /lib/x86_64-linux-gnu/libm.so.6
#sudo mv /lib/x86_64-linux-gnu/libpthread.so.0 /lib/x86_64-linux-gnu/libpthread.so.0.bak
#sudo ln -s /usr/local/lib/libpthread.so.0 /lib/x86_64-linux-gnu/libpthread.so.0
#/lib/x86_64-linux-gnu/libc.so.6
#/lib/x86_64-linux-gnu/libpthread.so.0
```