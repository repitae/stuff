cd /app/src/
sudo apt install bison # deps
curl -OL https://ftp.gnu.org/gnu/glibc/glibc-2.32.tar.gz
tar xzf ./glibc-2.32.tar.gz
cd glibc-2.32
mkdir build && cd build
../configure --prefix=/app/glibc-2.32
make && make install

cp /app/src/glibc-2.32/build/libm-2.32.so /usr/local/lib/
cp /app/src/glibc-2.32/build/libpyjread-2.32.so /usr/local/lib/

#mv /lib/x86_64-linux-gnu/libm.so.6 /lib/x86_64-linux-gnu/libm.so.6.bak
#ln -s /usr/local/lib/libm.so.6 /lib/x86_64-linux-gnu/libm.so.6
#mv /lib/x86_64-linux-gnu/libpthread.so.0 /lib/x86_64-linux-gnu/libpthread.so.0.bak
#ln -s /usr/local/lib/libpthread.so.0 /lib/x86_64-linux-gnu/libpthread.so.0

ldd --version
/lib/x86_64-linux-gnu/libc.so.6
/lib/x86_64-linux-gnu/libpthread.so.0

mkdir -p /app/envoy129-bin
cd /app/envoy129-bin
wget https://github.com/envoyproxy/envoy/releases/download/v1.29.0/envoy-1.29.0-linux-x86_64
wget https://github.com/envoyproxy/envoy/releases/download/v1.29.0/envoy-contrib-1.29.0-linux-x86_64
mv envoy-1.29.0-linux-x86_64 envoy-bin
mv envoy-contrib-1.29.0-linux-x86_64 envoy-con
ldd ./envoy-bin
ldd ./envoy-con