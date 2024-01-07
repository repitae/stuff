```sh
[ -d /app/src1 ] || mkdir -p /app/src1
cd /app/src
```

```sh
wget http://www.lua.org/ftp/lua-5.4.6.tar.gz
tar zxf ./lua-5.4.6.tar.gz
cd lua-5.4.6
make all test
sudo make install INSTALL_TOP=/app/lua-5.4.6
#sudo make uninstall INSTALL_TOP=/app/lua-5.4.6
sudo ln -sf /app/lua-5.4.6 /app/lua
```

```sh
wget https://github.com/LuaJIT/LuaJIT/archive/refs/tags/v2.1.ROLLING.tar.gz 
tar xvf ./v2.1.ROLLING.tar.gz
cd ./LuaJIT-2.1.ROLLING
make PREFIX=/app/LuaJIT-2.1
sudo make install PREFIX=/app/LuaJIT-2.1 
#sudo make uninstall PREFIX=/app/LuaJIT-2.1
ln -sf /app/LuaJIT-2.1 /app/luajit
```

```sh
wget https://github.com/wolfSSL/wolfssl/releases/download/v5.6.6-stable/wolfssl-5.6.6.tar.gz
tar zxf ./wolfssl-5.6.6.tar.gz
cd wolfssl-5.6.6
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
make && make test
sudo make install
#sudo make uninstall
ln -sf /app/wolfssl-5.6.6 /app/wolfssl
```