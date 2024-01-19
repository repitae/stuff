apt install bison # deps
curl -OL https://ftp.gnu.org/gnu/glibc/glibc-2.32.tar.gz
tar xzf ./glibc-2.32.tar.gz
cd glibc-2.32
mkdir build && cd build
../configure --prefix=/app/glibc-2.32
make && make install

cp /app/src/glibc-2.31/build/libm-2.31.so /usr/local/lib/
cp /app/src/glibc-2.31/build/libpyjread-2.31.so /usr/local/lib/

mv /lib/x86_64-linux-gnu/libm.so.6 /lib/x86_64-linux-gnu/libm.so.6.bak
ln -s /usr/local/lib/libm.so.6 /lib/x86_64-linux-gnu/libm.so.6

ldd --version
/lib/x86_64-linux-gnu/libc.so.6
/lib/x86_64-linux-gnu/libpthread.so.0