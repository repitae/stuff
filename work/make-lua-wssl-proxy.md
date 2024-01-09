```sh
apt-get update
sudo apt-get install build-essential
[[ -d /app/src ]] || mkdir -p /app/src
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
curl -LO https://github.com/wolfSSL/wolfssl/releases/download/v5.6.6-stable/wolfssl-5.6.6.tar.gz
[[ $? -eq 0 ]] && tar zxf ./wolfssl-5.6.6.tar.gz
```

```sh
cd /app/src/wolfssl-5.6.6
make clean
./configure --prefix=/app/wolfssl-5.6.6-lw --enable-haproxy --enable-quic \
  --enable-examples \
  --enable-crypttests \
  --enable-crypttests-libs
[[ $? -eq 0 ]] && make -j $(nproc)
make test && sudo make install
/app/src/wolfssl-5.6.6-lw/wolfcrypt/benchmark/benchmark
ln -sf /app/wolfssl-5.6.6-lw /app/wolfssl-lw
```

```sh
cd /app/src/wolfssl-5.6.6-mp
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
  --enable-intelasm \
  --enable-quic \
  --enable-sni \
  --enable-sp-asm \  
  --enable-sp-math-all \
  --enable-session-ticket \
  --enable-tlsx \
  --disable-oldtls
[[ $? -eq 0 ]] && make -j $(nproc)
make test && sudo make install
/app/src/wolfssl-5.6.6-mp/wolfcrypt/benchmark/benchmark
ln -sf /app/wolfssl-5.6.6-mp /app/wolfssl-mp
```

```sh
cd /app/src/wolfssl-5.6.6
make clean
./configure --prefix=/app/wolfssl-5.6.6 \
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
  --enable-intelasm \
  --enable-quic \
  --enable-sni \
  --enable-sp-asm \
  --enable-sp-math \
  --enable-session-ticket \
  --enable-tlsx \
  --disable-oldtls
[[ $? -eq 0 ]] && make -j $(nproc)
make test && sudo make install
/app/src/wolfssl-5.6.6/wolfcrypt/benchmark/benchmark
ln -sf /app/wolfssl-5.6.6 /app/wolfssl
```

```sh
cd /app/src/
curl -LO https://www.haproxy.org/download/2.8/src/haproxy-2.8.5.tar.gz
[[ $? -eq 0 ]] && tar xvf ./haproxy-2.8.5.tar.gz
curl -LO https://www.haproxy.org/download/2.9/src/haproxy-2.9.1.tar.gz
[[ $? -eq 0 ]] && tar xvf ./haproxy-2.9.1.tar.gz
```

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
  SSL_LIB=/app/wolfssl-lw/lib \
  SSL_INC=/app/wolfssl-lw/include \
  ADDLIB='-Wl,-rpath=/app/wolfssl-lw/lib'
make install PREFIX=/app/haproxy-2.8.5-lw
ldd /app/haproxy-2.8.5-lw/sbin/haproxy
/app/haproxy-2.8.5-lw/sbin/haproxy -vv
ln -sf /app/haproxy-2.8.5-lw /app/haproxy-lw
[[ -d '/app/haproxy-lw/{etc,log,run,ssl}' ]] || mkdir -p /app/haproxy-lw/{etc,log,run,ssl}
```

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
  SSL_LIB=/app/wolfssl/lib \
  SSL_INC=/app/wolfssl/include \
  ADDLIB='-Wl,-rpath=/app/wolfssl/lib'
make install PREFIX=/app/haproxy-2.8.5
ldd /app/haproxy-2.8.5/sbin/haproxy
/app/haproxy-2.8.5/sbin/haproxy -vv
ln -sf /app/haproxy-2.8.5 /app/haproxy
[[ -d '/app/haproxy/{etc,log,run,ssl}' ]] || mkdir -p /app/haproxy/{etc,log,run,ssl}
```

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
[[ -d '/app/haproxy/{etc,log,run,ssl}' ]] || mkdir -p /app/haproxy/{etc,log,run,ssl}
```

```sh
useradd -M -U -r -s `which nologin` -d /app/haproxy haproxy
chown -R haproxy:haproxy /app/haproxy*
```

```sh
cat << EOF | sudo tee /etc/systemd/system/haproxy.service
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
```

```sh
cat << EOF | sudo tee /app/haproxy/etc/default
CONFIG=/app/haproxy/etc/haproxy.cfg
PIDFILE=/app/haproxy/run/haproxy.pid
EXTRAOPTS="-S /app/haproxy/run/master.sock"
EOF
cat << EOF | sudo tee /app/haproxy/etc/haproxy.cfg
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
sudo chmod 644 /etc/systemd/system/haproxy.service
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable haproxy
sudo systemctl start haproxy
sudo systemctl status haproxy
sudo systemctl list-units --failed
sudo journalctl --flush --rotate --vacuum-time=1m
```

```sh
```


---
$ /app/src/wolfssl-5.6.6/wolfcrypt/benchmark/benchmark
------------------------------------------------------------------------------
 wolfSSL version 5.6.6 wAESNI wSP-MATH
------------------------------------------------------------------------------
Math:   Single Precision: ecc 256 384 521 rsa/dh 2048 3072 4096 asm sp_x86_64.c
wolfCrypt Benchmark (block bytes 1048576, min 1.0 sec each)
---
|RNG                        |235 MiB took 1.011 seconds, 232.456 MiB/s Cycles per byte =  10.24
|AES-128-CBC-enc           |2210 MiB took 1.002 seconds, 2205.383 MiB/s Cycles per byte =   1.08
|AES-128-CBC-dec          |14675 MiB took 1.000 seconds, 14672.362 MiB/s Cycles per byte =   0.16
|AES-192-CBC-enc           |1880 MiB took 1.002 seconds, 1876.939 MiB/s Cycles per byte =   1.27
|AES-192-CBC-dec          |12215 MiB took 1.000 seconds, 12213.789 MiB/s Cycles per byte =   0.19
|AES-256-CBC-enc           |1625 MiB took 1.001 seconds, 1622.593 MiB/s Cycles per byte =   1.47
|AES-256-CBC-dec          |10575 MiB took 1.000 seconds, 10572.767 MiB/s Cycles per byte =   0.23
|AES-128-GCM-enc           |8900 MiB took 1.000 seconds, 8898.789 MiB/s Cycles per byte =   0.27
|AES-128-GCM-dec           |8915 MiB took 1.000 seconds, 8911.112 MiB/s Cycles per byte =   0.27
|AES-192-GCM-enc           |8105 MiB took 1.001 seconds, 8100.635 MiB/s Cycles per byte =   0.29
|AES-192-GCM-dec           |8150 MiB took 1.000 seconds, 8149.728 MiB/s Cycles per byte =   0.29
|AES-256-GCM-enc           |7435 MiB took 1.000 seconds, 7434.965 MiB/s Cycles per byte =   0.32
|AES-256-GCM-dec           |7480 MiB took 1.001 seconds, 7475.138 MiB/s Cycles per byte =   0.32
|GMAC Table 4-bit          |2300 MiB took 1.000 seconds, 2299.085 MiB/s Cycles per byte =   1.04
|AES-128-CTR                |940 MiB took 1.004 seconds,  936.447 MiB/s Cycles per byte =   2.54
|AES-192-CTR                |875 MiB took 1.005 seconds,  870.415 MiB/s Cycles per byte =   2.73
|AES-256-CTR                |820 MiB took 1.003 seconds,  817.689 MiB/s Cycles per byte =   2.91
|CHACHA                    |3855 MiB took 1.001 seconds, 3851.156 MiB/s Cycles per byte =   0.62
|CHA-POLY                  |2650 MiB took 1.001 seconds, 2646.975 MiB/s Cycles per byte =   0.90
|MD5                        |935 MiB took 1.002 seconds,  933.515 MiB/s Cycles per byte =   2.55
|POLY1305                  |8305 MiB took 1.000 seconds, 8303.337 MiB/s Cycles per byte =   0.29
|SHA                        |945 MiB took 1.002 seconds,  942.824 MiB/s Cycles per byte =   2.52
|SHA-224                    |570 MiB took 1.007 seconds,  566.124 MiB/s Cycles per byte =   4.20
|SHA-256                    |570 MiB took 1.009 seconds,  565.121 MiB/s Cycles per byte =   4.21
|SHA-384                    |875 MiB took 1.001 seconds,  874.172 MiB/s Cycles per byte =   2.72
|SHA-512                    |875 MiB took 1.006 seconds,  870.056 MiB/s Cycles per byte =   2.74
|SHA-512/224                |875 MiB took 1.003 seconds,  872.674 MiB/s Cycles per byte =   2.73
|SHA-512/256                |875 MiB took 1.003 seconds,  872.424 MiB/s Cycles per byte =   2.73
|SHA3-224                   |595 MiB took 1.008 seconds,  590.317 MiB/s Cycles per byte =   4.03
|SHA3-256                   |565 MiB took 1.009 seconds,  560.214 MiB/s Cycles per byte =   4.25
|SHA3-384                   |430 MiB took 1.003 seconds,  428.804 MiB/s Cycles per byte =   5.55
|SHA3-512                   |300 MiB took 1.004 seconds,  298.834 MiB/s Cycles per byte =   7.97
|HMAC-MD5                   |935 MiB took 1.003 seconds,  932.086 MiB/s Cycles per byte =   2.55
|HMAC-SHA                   |950 MiB took 1.003 seconds,  946.893 MiB/s Cycles per byte =   2.51
|HMAC-SHA224                |570 MiB took 1.008 seconds,  565.471 MiB/s Cycles per byte =   4.21
|HMAC-SHA256                |565 MiB took 1.007 seconds,  561.139 MiB/s Cycles per byte =   4.24
|HMAC-SHA384                |870 MiB took 1.001 seconds,  869.514 MiB/s Cycles per byte =   2.74
|HMAC-SHA512                |880 MiB took 1.001 seconds,  879.217 MiB/s Cycles per byte =   2.71
|PBKDF2                      |64 KiB took 1.000 seconds,   63.499 KiB/s Cycles per byte = 38386.49
|RSA     2048  key gen        |34 ops took 1.027 sec, avg 30.191 ms, 33.122 ops/sec
|RSA     2048   public     |90200 ops took 1.001 sec, avg 0.011 ms, 90140.233 ops/sec
|RSA     2048  private      |2700 ops took 1.015 sec, avg 0.376 ms, 2661.310 ops/sec
|DH      2048  key gen      |5432 ops took 1.000 sec, avg 0.184 ms, 5431.191 ops/sec
|DH      2048    agree      |5500 ops took 1.008 sec, avg 0.183 ms, 5456.445 ops/sec
|ECC   [      SECP256R1]   |256  key gen    109300 ops took 1.000 sec, avg 0.009 ms, 109277.463 ops/sec
|ECDHE [      SECP256R1]   |256    agree     29200 ops took 1.000 sec, avg 0.034 ms, 29187.704 ops/sec
|ECDSA [      SECP256R1]   |256     sign     71700 ops took 1.000 sec, avg 0.014 ms, 71672.300 ops/sec
|ECDSA [      SECP256R1]   |256   verify     27600 ops took 1.001 sec, avg 0.036 ms, 27561.454 ops/sec
|CURVE  25519  key gen     |49427 ops took 1.000 sec, avg 0.020 ms, 49426.741 ops/sec
|CURVE  25519    agree     |50900 ops took 1.000 sec, avg 0.020 ms, 50887.164 ops/sec
Benchmark complete