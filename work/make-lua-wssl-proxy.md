```sh
apt-get update
sudo apt-get install build-essential
[ -d /app/src ] || mkdir -p /app/src
```

```sh
cd /app/src/
curl -LO http://www.lua.org/ftp/lua-5.4.6.tar.gz
tar zxf ./lua-5.4.6.tar.gz
cd lua-5.4.6
make clean
make -j $(nproc) all test
sudo make install INSTALL_TOP=/app/lua-5.4.6
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
ln -sf /app/LuaJIT-2.1 /app/luajit
```

```sh
cd /app/src/
curl -LO https://github.com/wolfSSL/wolfssl/releases/download/v5.6.6-stable/wolfssl-5.6.6.tar.gz
[[ $? -eq 0 ]] && tar zxf ./wolfssl-5.6.6.tar.gz
cd wolfssl-5.6.6
make clean
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
  --enable-session-ticket \
  --enable-earlydata \
  --disable-oldtls
[[ $? -eq 0 ]] && make -j $(nproc)
make test && sudo make install
ln -sf /app/wolfssl-5.6.6 /app/wolfssl
#wolfssl genkey rsa -size 2048 -out mykey -outform pem -output KEY
#wolfssl req -new -days 3650 -key mykey.priv -out test.cert -x509
openssl req -new > cert.csr
openssl rsa -in privkey.pem -out key.pem
openssl x509 -in cert.csr -out cert.pem -req -signkey key.pem -days 1001
cat key.pem >> cert.pem
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
make -j $(nproc) TARGET=linux-glibc \
  CPU=generic \
  ARCH=x86_64 \
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
  SSL_INC=/app/wolfssl/include \
  ADDLIB='-Wl,-rpath=/app/wolfssl/lib'
make install PREFIX=/app/haproxy-2.8.5
ldd /app/haproxy-2.8.5/sbin/haproxy
/app/haproxy-2.8.5/sbin/haproxy -vv
ln -sf /app/haproxy-2.8.5 /app/haproxy
[ -d '/app/haproxy/{etc,log,run}' ] || mkdir -p /app/haproxy/{etc,log,run}
```

```sh
useradd -M -U -r -s `which nologin` -d /app/haproxy haproxy
chown -R haproxy:haproxy /app/haproxy
```

```sh
cat << EOF | sudo tee /etc/systemd/system/haproxy.service
[Unit]
Description=haproxy.service
After=network-online.target
Wants=network-online.target

[Service]
EnvironmentFile=-/app/haproxy/default
EnvironmentFile=-/app/haproxy/sysconfig
Environment="CONFIG=/app/haproxy/haproxy.cfg" "PIDFILE=/app/haproxy/run/haproxy.pid" "EXTRAOPTS=-S /app/haproxy/run/master.sock"
ExecStartPre=/app/haproxy/sbin/haproxy -f $CONFIG -c -q
ExecStart=/app/haproxy/sbin/haproxy -Ws -f $CONFIG -p $PIDFILE $EXTRAOPTS
ExecReload=/app/haproxy/sbin/haproxy -Ws -f $CONFIG -c -q $EXTRAOPTS
ExecReload=/bin/kill -USR2 $MAINPID
KillMode=mixed
Restart=on-failure
RestartSec=5s
SuccessExitStatus=143
Type=notify

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo chmod 644 /etc/systemd/system/haproxy.service
/app/haproxy/sbin/haproxy -c -f /app/haproxy/etc/haproxy.cfg
sudo systemctl daemon-reload
sudo systemctl enable haproxy
sudo systemctl start haproxy
sudo systemctl status haproxy
sudo systemctl list-units --failed
sudo journalctl --flush --rotate --vacuum-time=1m
```

```sh
openssl ciphers -V 'ECDHE+AESGCM:EDH+AESGCM'
openssl ciphers -V 'ECDHE+AESGCM:EDH+AESGCM:ECDHE+AES:EDH+AES'
```