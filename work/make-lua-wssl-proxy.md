```sh
[ -d /app/src1 ] || mkdir -p /app/src1
```

```sh
cd /app/src/
curl -LO http://www.lua.org/ftp/lua-5.4.6.tar.gz
tar zxf ./lua-5.4.6.tar.gz
cd lua-5.4.6
make clean
make -j $(nproc) all test
sudo make install INSTALL_TOP=/app/lua-5.4.6
#sudo make uninstall INSTALL_TOP=/app/lua-5.4.6
sudo ln -sf /app/lua-5.4.6 /app/lua
```

```sh
cd /app/src/
curl -LO https://github.com/LuaJIT/LuaJIT/archive/refs/tags/v2.1.ROLLING.tar.gz 
[[ $? -eq 0 ]] && tar xvf ./v2.1.ROLLING.tar.gz
cd ./LuaJIT-2.1.ROLLING
make clean
make -j $(nproc) PREFIX=/app/LuaJIT-2.1
sudo make install PREFIX=/app/LuaJIT-2.1 
#sudo make uninstall PREFIX=/app/LuaJIT-2.1
ln -sf /app/LuaJIT-2.1 /app/luajit
```

```sh
cd /app/src/
curl -LO https://github.com/wolfSSL/wolfssl/releases/download/v5.6.6-stable/wolfssl-5.6.6.tar.gz
[[ $? -eq 0 ]] && tar zxf ./wolfssl-5.6.6.tar.gz
cd wolfssl-5.6.6
make clean
#./configure --prefix=/app/wolfssl --enable-aesni --enable-afalg --enable-alpn --enable-fallback-scsv --enable-haproxy --enable-hrrcookie \
#  --enable-intelasm --enable-quic --enable-rwlock --enable-sni --enable-sp --enable-sp-asm --enable-sp-math --disable-oldtls
./configure --prefix=/app/wolfssl-5.6.6 \
  --enable-aesni \
  --enable-alpn \
  --enable-fallback-scsv \
  --enable-haproxy \
  --enable-hrrcookie \
  --enable-intelasm \
  --enable-quic \
  --enable-sni \
  --enable-sp \
  --enable-sp-asm \
  --enable-sp-math \
  --disable-oldtls
[[ $? -eq 0 ]] && make -j $(nproc)
make test && sudo make install
#sudo make uninstall
ln -sf /app/wolfssl-5.6.6 /app/wolfssl
```

```sh
cd /app/src/
curl -LO https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.42/pcre2-10.42.tar.gz
[[ $? -eq 0 ]] && tar xvf ./pcre2-10.42.tar.gz
cd ./pcre2-10.42
make clean
./configure --prefix=/app/pcre2-10.42 \
  --enable-pcre2-16 \
  --enable-pcre2-32 \
  --enable-jit
[[ $? -eq 0 ]] && make -j $(nproc)
make check && sudo make install
ln -sf /app/pcre2-10.42 /app/pcre2
```
```sh
cd /app/src/
curl -LO https://sourceforge.net/projects/pcre/files/pcre/8.45/pcre-8.45.tar.gz/download
[[ $? -eq 0 ]] && tar xvf ./pcre-8.45.tar.gz
cd ./pcre-8.45
make clean
./configure --prefix=/app/pcre-8.45 \
  --enable-utf \
  --enable-jit
[[ $? -eq 0 ]] && make -j $(nproc)
make check && sudo make install
ln -sf /app/pcre-8.45 /app/pcre

```

```sh
cd /app/src/
curl -LO https://www.haproxy.org/download/2.8/src/haproxy-2.8.5.tar.gz
curl -LO https://www.haproxy.org/download/2.9/src/haproxy-2.9.1.tar.gz
[[ $? -eq 0 ]] && tar xvf ./haproxy-2.8.5.tar.gz
[[ $? -eq 0 ]] && tar xvf ./haproxy-2.9.1.tar.gz
cd ./haproxy-2.8.5
make clean
make -j $(nproc) ARCH=64 CPU=generic \
  TARGET=linux-glibc \
  USE_CRYPT_H=1 \
  USE_ENGINE=1 \
  USE_LIBCRYPT=1 \
  USE_LUA=1 \
  USE_NS=1 \
  USE_OPENSSL_WOLFSSL=1 \
  USE_PCRE=1 \
  USE_PCRE_JIT=1 \
  USE_STATIC_PCRE=1 \
  USE_QUIC=1 \
  USE_SYSTEMD=1 \
  USE_TFO=1 \
  USE_THREAD=1 \
  PCREDIR=/app/pcre \
  LUA_LIB=/app/lua/lib \
  LUA_INC=/app/lua/include \
  SSL_LIB=/app/wolfssl/lib \
  SSL_INC=/app/wolfssl/include
make install PREFIX=/app/haproxy-2.8.5
#make uninstall PREFIX=/app/haproxy-2.8.5
ldd /app/haproxy-2.8.5/sbin/haproxy | grep 'not found'
