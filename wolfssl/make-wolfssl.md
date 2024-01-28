### Basic
```sh
apt-get update
sudo apt-get install build-essential
[[ -d /app/src ]] ||  mkdir -p /app/src
```

### Lua-5.4.6
```sh
cd /app/src/
curl -LO http://www.lua.org/ftp/lua-5.4.6.tar.gz
[[ $? -eq 0 ]] && tar zxf ./lua-5.4.6.tar.gz
cd lua-5.4.6
make clean
make -j $(nproc) all test
sudo make install INSTALL_TOP=/app/lua-5.4.6
sudo ln -sf /app/lua-5.4.6 /app/lua
```

### LuaJIT-2.1
```sh
cd /app/src/
curl -LO https://github.com/LuaJIT/LuaJIT/archive/refs/tags/v2.1.ROLLING.tar.gz 
[[ $? -eq 0 ]] && tar zxf ./v2.1.ROLLING.tar.gz
cd ./LuaJIT-2.1.ROLLING
make clean
make -j $(nproc) PREFIX=/app/LuaJIT-2.1
sudo make install PREFIX=/app/LuaJIT-2.1 
ln -sf /app/LuaJIT-2.1 /app/luajit
```

### PCRE-8.45
```sh
cd /app/src/
curl -LO https://sourceforge.net/projects/pcre/files/pcre/8.45/pcre-8.45.tar.gz/download
[[ $? -eq 0 ]] && tar zxf ./pcre-8.45.tar.gz
cd ./pcre-8.45
make clean
./configure --prefix=/app/pcre-8.45 \
  --enable-utf \
  --enable-jit
[[ $? -eq 0 ]] && make -j $(nproc)
make check && sudo make install
ln -sf /app/pcre-8.45 /app/pcre
```

### PCRE2-10.42
```sh
cd /app/src/
curl -LO https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.42/pcre2-10.42.tar.gz
[[ $? -eq 0 ]] && tar zxf ./pcre2-10.42.tar.gz
cd ./pcre2-10.42
make clean
./configure --prefix=/app/pcre2-10.42 \
  --enable-jit
[[ $? -eq 0 ]] && make -j $(nproc)
make check && sudo make install
ln -sf /app/pcre2-10.42 /app/pcre2
```

### OpenSSL-3.1.4-QUIC
```sh
cd /app/src/
curl -LO https://github.com/quictls/openssl/archive/refs/tags/openssl-3.1.4-quic1.tar.gz
[[ $? -eq 0 ]] && tar zxf ./openssl-3.1.4-quic1.tar.gz
cd ./openssl-openssl-3.1.4-quic1
make clean
./config --prefix=/app/openssl-3.1.4-quic1 no-deprecated no-legacy no-ssl
[[ $? -eq 0 ]] && make -j $(nproc)
make test && sudo make install
ln -sf /app/openssl-3.1.4-quic1 /app/openssl
```

### OpenSSL-3.2.0
```sh
cd /app/src/
curl -LO https://www.openssl.org/source/openssl-3.2.0.tar.gz
[[ $? -eq 0 ]] && tar zxf ./openssl-3.2.0.tar.gz
cd ./openssl-3.2.0
make clean
./config --prefix=/app/openssl-3.2.0 no-deprecated no-legacy no-ssl enable-quic
[[ $? -eq 0 ]] && make -j $(nproc)
make test && sudo make install
ln -sf /app/openssl-3.2.0 /app/openssl
```

### WolfSSL-5.6.6
```sh
cd /app/src/
curl -LO https://github.com/wolfSSL/wolfssl/releases/download/v5.6.6-stable/wolfssl-5.6.6.tar.gz
[[ $? -eq 0 ]] && tar zxf ./wolfssl-5.6.6.tar.gz
```
### WolfSSL-5.6.6-MP-Math-All
```sh
cd /app/src/wolfssl-5.6.6
make clean
./configure --prefix=/app/wolfssl-5.6.6-mp \
  --enable-aesni \
  --enable-alpn \
  --enable-earlydata \
  --enable-examples \
  --enable-crypttests \
  --enable-crypttests-libs \
  --enable-fallback-scsv \
  --enable-fpecc \
  --enable-haproxy \
  --enable-hrrcookie \
  --enable-hugecache \
  --enable-intelasm \
  --enable-quic \
  --enable-sni \
  --enable-sp-asm \
  --enable-sp-math-all \
  --enable-secure-renegotiation \
  --enable-session-ticket \
  --enable-tls13 \
  --enable-tlsx \
  --disable-oldtls
  
[[ $? -eq 0 ]] && make -j $(nproc)
make test && sudo make install
/app/src/wolfssl-5.6.6/wolfcrypt/benchmark/benchmark # mp
ln -sf /app/wolfssl-5.6.6-mp /app/wolfssl-mp
```

### WolfSSL-5.6.6-SP-Math-Restricted
```sh
cd /app/src/wolfssl-5.6.6
make clean
./configure --prefix=/app/wolfssl-5.6.6-sp \
  --enable-aesni \
  --enable-alpn \
  --enable-bigcache \
  --enable-earlydata \
  --enable-examples \
  --enable-certext \
  --enable-crypttests \
  --enable-crypttests-libs \
  --enable-fallback-scsv \
  --enable-fpecc \
  --enable-haproxy \
  --enable-hrrcookie \
  --enable-intelasm \
  --enable-maxfragment \
  --enable-quic \
  --enable-sni \
  --enable-sp-asm \
  --enable-sp-math \
  --enable-secure-renegotiation \
  --enable-session-ticket \
  --enable-supportedcurves \
  --enable-tls13 \
  --enable-tlsx \
  --disable-oldtls
  
[[ $? -eq 0 ]] && make -j $(nproc)
make test && sudo make install
/app/src/wolfssl-5.6.6/wolfcrypt/benchmark/benchmark  # sp
ln -sf /app/wolfssl-5.6.6-sp /app/wolfssl-sp
```

### HaProxy-2.8.5
```sh
cd /app/src/
curl -LO https://www.haproxy.org/download/2.8/src/haproxy-2.8.5.tar.gz
[[ $? -eq 0 ]] && tar zxf ./haproxy-2.8.5.tar.gz
```

### HaProxy-2.9.1
```sh
cd /app/src/
curl -LO https://www.haproxy.org/download/2.9/src/haproxy-2.9.1.tar.gz
[[ $? -eq 0 ]] && tar zxf ./haproxy-2.9.1.tar.gz
```

### HaProxy-2.8.5-WolfSSL-5.6.6-MP-Math-All
```sh
cd /app/src/haproxy-2.8.5
make clean
# make -j $(nproc) CPU=generic ARCH=x86_64 TARGET=linux-glibc \
make -j $(nproc) TARGET=linux-glibc \
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
  SSL_LIB=/app/wolfssl-mp/lib \
  SSL_INC=/app/wolfssl-mp/include \
  ADDLIB='-Wl,-rpath=/app/wolfssl-mp/lib'
make install PREFIX=/app/haproxy-2.8.5-mp
ldd /app/haproxy-2.8.5-mp/sbin/haproxy
/app/haproxy-2.8.5-mp/sbin/haproxy -vv
ln -sf /app/haproxy-2.8.5-mp /app/haproxy-mp
[[ -d '/app/haproxy-mp/{etc,log,run,ssl}' ]] ||  mkdir -p /app/haproxy-mp/{etc,log,run,ssl}
```

### HaProxy-2.8.5-WolfSSL-5.6.6-SP-Math-Restricted
```sh
cd /app/src/haproxy-2.8.5
make clean
# make -j $(nproc) CPU=generic ARCH=x86_64 TARGET=linux-glibc \
make -j $(nproc) TARGET=linux-glibc \
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
  SSL_LIB=/app/wolfssl-sp/lib \
  SSL_INC=/app/wolfssl-sp/include \
  ADDLIB='-Wl,-rpath=/app/wolfssl-sp/lib'
make install PREFIX=/app/haproxy-2.8.5-sp
ldd /app/haproxy-2.8.5-sp/sbin/haproxy
/app/haproxy-2.8.5/sbin/haproxy -vv
ln -sf /app/haproxy-2.8.5-sp /app/haproxy-sp
[[ -d '/app/haproxy-2.8.5-sp/{etc,log,run,ssl}' ]] ||  mkdir -p /app/haproxy-2.8.5-sp/{etc,log,run,ssl}
```

### HaProxy-2.8.5-OpenSSL-3.1.4-QUIC
```sh
cd /app/src/haproxy-2.8.5
make clean
make -j $(nproc) TARGET=linux-glibc \
  USE_CRYPT_H=1 \
  USE_ENGINE=1 \
  USE_LIBCRYPT=1 \
  USE_LUA=1 \
  USE_NS=1 \
  USE_OPENSSL=1 \
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
  SSL_LIB=/app/openssl-3.1.4-quic1/lib64 \
  SSL_INC=/app/openssl-3.1.4-quic1/include \
  ADDLIB="-Wl,-rpath=/app/openssl-3.1.4-quic1/lib64" \
  LDFLAGS="-Wl,-V,-rpath,/app/openssl-3.1.4-quic1/lib"
make install PREFIX=/app/haproxy-2.8.5-openssl-3.1.4-quic1
#make uninstall PREFIX=/app/haproxy-2.8.5-openssl-3.1.4-quic1
ldd /app/haproxy-2.8.5-openssl-3.1.4-quic1/sbin/haproxy
/app/haproxy-2.8.5-openssl-3.1.4-quic1/sbin/haproxy -vv
[[ -d '/app/haproxy-2.8.5-openssl-3.1.4-quic1/{etc,log,run,ssl}' ]] ||  mkdir -p /app/haproxy-2.8.5-openssl-3.1.4-quic1/{etc,log,run,ssl}
```

### HaProxy-2.8.5-OpenSSL-3.2.0
```sh
cd /app/src/haproxy-2.8.5
make clean
# make -j $(nproc) CPU=generic ARCH=x86_64 TARGET=linux-glibc \
make -j $(nproc) TARGET=linux-glibc \
  USE_CRYPT_H=1 \
  USE_ENGINE=1 \
  USE_LIBCRYPT=1 \
  USE_LUA=1 \
  USE_NS=1 \
  USE_OPENSSL=1 \
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
  SSL_LIB=/app/openssl-3.2.0/lib \
  SSL_INC=/app/openssl-3.2.0/include \
  ADDLIB='-Wl,-rpath=/app/openssl-3.2.0/lib'
make install PREFIX=/app/haproxy-2.8.5-openssl-3.2.0
ldd /app/haproxy-2.8.5-openssl-3.2.0/sbin/haproxy
/app/haproxy-2.8.5-openssl-3.2.0/sbin/haproxy -vv
[[ -d '/app/haproxy-2.8.5-openssl-3.2.0/{etc,log,run,ssl}' ]] ||  mkdir -p /app/haproxy-2.8.5-openssl-3.2.0/{etc,log,run,ssl}
```

### HaProxy-2.9.1 (Default)
```sh
cd /app/src/haproxy-2.9.1
make clean
# make -j $(nproc) CPU=generic ARCH=x86_64 TARGET=linux-glibc \
make -j $(nproc) TARGET=linux-glibc \
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
make install PREFIX=/app/haproxy-2.9.1
ldd /app/haproxy-2.9.1/sbin/haproxy
/app/haproxy-2.9.1/sbin/haproxy -vv
[[ -d '/app/haproxy-2.9.1/{etc,log,run,ssl}' ]] ||  mkdir -p /app/haproxy-2.9.1/{etc,log,run,ssl}
```

### User
```sh
useradd -M -U -r -s `which nologin` -d /app/haproxy haproxy
chown -R haproxy:haproxy /app/haproxy*
```

### Service
```sh
cat << EOF |  sudo tee /etc/systemd/system/haproxy.service
[Unit]
Description=HAProxy Load Balancer
After=network-online.target
Wants=network-online.target

[Service]
EnvironmentFile=/app/haproxy/etc/default
ExecStartPre=/app/haproxy/sbin/haproxy -f $CONFIG -c -q $EXTRAOPTS
ExecStart=/app/haproxy/sbin/haproxy -Ws -f $CONFIG -p $PIDFILE $EXTRAOPTS
ExecReload=/app/haproxy/sbin/haproxy -f $CONFIG -c -q $EXTRAOPTS
ExecReload=/bin/kill -USR2 $MAINPID
KillMode=mixed
Restart=always
RestartSec=5
# StartLimitBurst=5
# StartLimitInterval=30
StartLimitInterval=0
SuccessExitStatus=143
Type=notify

[Install]
WantedBy=multi-user.target
EOF
sudo chmod 644 /etc/systemd/system/haproxy.service
```

### Configs
```sh
cat << EOF |  sudo tee /app/haproxy/etc/default
CONFIG=/app/haproxy/etc/haproxy.cfg
PIDFILE=/app/haproxy/run/haproxy.pid
EXTRAOPTS="-S /app/haproxy/run/master.sock"
EOF
cat << EOF |  sudo tee /app/haproxy/etc/haproxy.cfg
global
  user nobody
  group nogroup
  profiling.tasks on
  tune.ssl.default-dh-param 2048
  ssl-dh-param-file /app/haproxy/ssl/dhparam.pem
  stats socket /app/haproxy/run/admin.sock user nobody group nogroup mode 660 level admin
  # openssl ciphers -V 'ECDHE+AESGCM:EDH+AESGCM'
  # openssl ciphers -V 'ECDHE+AESGCM:EDH+AESGCM:ECDHE+AES:EDH+AES'
  # nmap --script ssl-enum-ciphers -p 443 192.168.1.112
  # ssl-default-servers-ciphers EECDH+AESGCM+ASH2:EDH+AESGCM:EECDH+AES:EDH+AES
  ssl-default-bind-ciphers EECDH+AESGCM+ASH2:EDH+AESGCM
  ssl-default-bind-options ssl-min-ver TLSv1.2

defaults
  mode http
  log global
  timeout connect 5s
  timeout client 10s
  timeout server 10s
  timeout http-request 10s
  option forwarded
  option http-server-close
  option httplog

frontend www
  bind :80
  bind :443 ssl crt /app/haproxy/ssl/cert.crt alpn h2,http/1.1
  http-request redirect scheme https unless { ssl_fc }
  http-response set-header Strict-Transport-Security max-age=63072000
  default_backend srv

backend srv
  server s1 192.168.1.21:80
  server s2 192.168.1.22:80
EOF
/app/haproxy/sbin/haproxy -c -f /app/haproxy/etc/haproxy.cfg
```

### Systemd
```sh
sudo systemctl daemon-reload
sudo systemctl enable haproxy
sudo systemctl start haproxy
sudo systemctl status haproxy
sudo systemctl list-units --failed
sudo journalctl --flush --rotate --vacuum-time=1m
```

### Remarks
```sh
/app/src/wolfssl-5.6.6/wolfcrypt/benchmark/benchmark
/app/src/wolfssl-5.6.6-mp/wolfcrypt/benchmark/benchmark
/app/src/wolfssl-5.6.6-lw/wolfcrypt/benchmark/benchmark

openssl speed -bytes 10485767 -seconds 1 sha256 sha512
openssl speed -bytes 10485767 -seconds 1 -evp sha256 sha512

openssl speed -bytes 10485767 -seconds 1 aes-128-cbc aes-256-cbc
openssl speed -bytes 10485767 -seconds 1 -evp aes-128-cbc aes-256-cbc

openssl speed -bytes 10485767 -seconds 1 -evp rsa2048
openssl speed -bytes 10485767 -seconds 1 -evp rsa2048

openssl s_time -connect 192.168.1.112:443
```