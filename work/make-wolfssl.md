```sh
apt-get update
sudo apt-get install build-essential
[[ -d /app/src ]] | |  mkdir -p /app/src
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
[[ -d '/app/haproxy-lw/{etc,log,run,ssl}' ]] | |  mkdir -p /app/haproxy-lw/{etc,log,run,ssl}
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
[[ -d '/app/haproxy/{etc,log,run,ssl}' ]] | |  mkdir -p /app/haproxy/{etc,log,run,ssl}
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
[[ -d '/app/haproxy/{etc,log,run,ssl}' ]] | |  mkdir -p /app/haproxy/{etc,log,run,ssl}
```

```sh
useradd -M -U -r -s `which nologin` -d /app/haproxy haproxy
chown -R haproxy:haproxy /app/haproxy*
```

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
```

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

```
Make some tests:
1. without AES-NI and without SP-MATH = LOW
2. with AES-NI and without SP-MATH = MID
3. with AES-NI and with SP-MATH = BEST
```

> /app/src/wolfssl-5.6.6-lw/wolfcrypt/benchmark/benchmark  
> wolfSSL version 5.6.6 without AESNI without SP-MATH  
> Math:   Multi-Precision: Wolf(SP) word-size=64 bits=8192 sp_int.c  
> wolfCrypt Benchmark (block bytes 1048576, min 1.0 sec each)  

|  |  |  |
|:---|---:|---:|
| RNG                           |   155 MiB took 1.029 seconds |
| AES-128-CBC-enc               |   420 MiB took 1.011 seconds |
| AES-128-CBC-dec               |   450 MiB took 1.004 seconds |
| AES-192-CBC-enc               |   360 MiB took 1.007 seconds |
| AES-192-CBC-dec               |   380 MiB took 1.005 seconds |
| AES-256-CBC-enc               |   315 MiB took 1.011 seconds |
| AES-256-CBC-dec               |   325 MiB took 1.008 seconds |
| AES-128-GCM-enc               |   210 MiB took 1.017 seconds |
| AES-128-GCM-dec               |   210 MiB took 1.022 seconds |
| AES-192-GCM-enc               |   195 MiB took 1.021 seconds |
| AES-192-GCM-dec               |   190 MiB took 1.006 seconds |
| AES-256-GCM-enc               |   180 MiB took 1.019 seconds |
| AES-256-GCM-dec               |   180 MiB took 1.021 seconds |
| GMAC Table 4-bit              |   444 MiB took 1.000 seconds |
| AES-128-CTR                   |   360 MiB took 1.010 seconds |
| AES-192-CTR                   |   310 MiB took 1.006 seconds |
| AES-256-CTR                   |   275 MiB took 1.002 seconds |
| CHACHA                        |   670 MiB took 1.004 seconds |
| CHA-POLY                      |   500 MiB took 1.002 seconds |
| MD5                           |   935 MiB took 1.005 seconds |
| POLY1305                      |  1955 MiB took 1.003 seconds |
| SHA                           |   955 MiB took 1.002 seconds |
| SHA-224                       |   330 MiB took 1.001 seconds |
| SHA-256                       |   335 MiB took 1.007 seconds |
| SHA-384                       |   615 MiB took 1.003 seconds |
| SHA-512                       |   620 MiB took 1.001 seconds |
| SHA-512/224                   |   620 MiB took 1.008 seconds |
| SHA-512/256                   |   620 MiB took 1.007 seconds |
| SHA3-224                      |   510 MiB took 1.009 seconds |
| SHA3-256                      |   480 MiB took 1.009 seconds |
| SHA3-384                      |   365 MiB took 1.007 seconds |
| SHA3-512                      |   260 MiB took 1.015 seconds |
| HMAC-MD5                      |   935 MiB took 1.003 seconds |
| HMAC-SHA                      |   955 MiB took 1.000 seconds |
| HMAC-SHA224                   |   335 MiB took 1.013 seconds |
| HMAC-SHA256                   |   330 MiB took 1.009 seconds |
| HMAC-SHA384                   |   620 MiB took 1.007 seconds |
| HMAC-SHA512                   |   615 MiB took 1.005 seconds |
| PBKDF2                        |    41 KiB took 1.000 seconds |
| RSA   2048            key gen |    12 ops took 1.021 seconds |
| RSA   2048             public | 35500 ops took 1.001 seconds |
| RSA   2048            private |   700 ops took 1.073 seconds |
| DH    2048            key gen |  2941 ops took 1.000 seconds |
| DH    2048              agree |  1500 ops took 1.038 seconds |
| ECC   [SECP256R1] 256 key gen |  3300 ops took 1.002 seconds |
| ECDHE [SECP256R1] 256   agree |  3400 ops took 1.010 seconds |
| ECDSA [SECP256R1] 256    sign |  3300 ops took 1.023 seconds |
| ECDSA [SECP256R1] 256  verify |  5000 ops took 1.003 seconds |
| CURVE 25519           key gen | 30944 ops took 1.000 seconds |
| CURVE 25519             agree | 31300 ops took 1.002 seconds |

> Benchmark complete  

> /app/src/wolfssl-5.6.6-mp/wolfcrypt/benchmark/benchmark  
> wolfSSL version 5.6.6 with AESNI without SP-MATCH  
> Math:   Multi-Precision: Wolf(SP) word-size=64 bits=8192 sp_int.c  
> wolfCrypt Benchmark (block bytes 1048576, min 1.0 sec each)  

|  |  |  |
|:---|---:|---:|
| RNG                           |   235 MiB took 1.013 seconds |
| AES-128-CBC-enc               |  2195 MiB took 1.000 seconds |
| AES-128-CBC-dec               | 14560 MiB took 1.000 seconds |
| AES-192-CBC-enc               |  1870 MiB took 1.000 seconds |
| AES-192-CBC-dec               | 12120 MiB took 1.000 seconds |
| AES-256-CBC-enc               |  1620 MiB took 1.002 seconds |
| AES-256-CBC-dec               | 10480 MiB took 1.000 seconds |
| AES-128-GCM-enc               |  8890 MiB took 1.000 seconds |
| AES-128-GCM-dec               |  8900 MiB took 1.000 seconds |
| AES-192-GCM-enc               |  8080 MiB took 1.000 seconds |
| AES-192-GCM-dec               |  8075 MiB took 1.000 seconds |
| AES-256-GCM-enc               |  7415 MiB took 1.001 seconds |
| AES-256-GCM-dec               |  7455 MiB took 1.000 seconds |
| GMAC Table 4-bit              |  2304 MiB took 1.000 seconds |
| AES-128-CTR                   |   945 MiB took 1.004 seconds |
| AES-192-CTR                   |   870 MiB took 1.005 seconds |
| AES-256-CTR                   |   820 MiB took 1.001 seconds |
| CHACHA                        |  3830 MiB took 1.001 seconds |
| CHA-POLY                      |  2635 MiB took 1.001 seconds |
| MD5                           |   935 MiB took 1.001 seconds |
| POLY1305                      |  8210 MiB took 1.000 seconds |
| SHA                           |   940 MiB took 1.003 seconds |
| SHA-224                       |   570 MiB took 1.006 seconds |
| SHA-256                       |   565 MiB took 1.005 seconds |
| SHA-384                       |   875 MiB took 1.004 seconds |
| SHA-512                       |   845 MiB took 1.002 seconds |
| SHA-512/224                   |   875 MiB took 1.005 seconds |
| SHA-512/256                   |   880 MiB took 1.004 seconds |
| SHA3-224                      |   595 MiB took 1.002 seconds |
| SHA3-256                      |   565 MiB took 1.002 seconds |
| SHA3-384                      |   435 MiB took 1.004 seconds |
| SHA3-512                      |   300 MiB took 1.002 seconds |
| HMAC-MD5                      |   930 MiB took 1.003 seconds |
| HMAC-SHA                      |   945 MiB took 1.004 seconds |
| HMAC-SHA224                   |   570 MiB took 1.005 seconds |
| HMAC-SHA256                   |   570 MiB took 1.008 seconds |
| HMAC-SHA384                   |   885 MiB took 1.002 seconds |
| HMAC-SHA512                   |   875 MiB took 1.000 seconds |
| PBKDF2                        |    65 KiB took 1.000 seconds |
| RSA   2048            key gen |   11 ops took 1.071  seconds |
| RSA   2048             public | 36200 ops took 1.000 seconds |
| RSA   2048            private |   700 ops took 1.060 seconds |
| DH    2048            key gen |  2970 ops took 1.000 seconds |
| DH    2048              agree |  1500 ops took 1.045 seconds |
| ECC   [SECP256R1] 256 key gen | 3400 ops took 1.021  seconds |
| ECDHE [SECP256R1] 256   agree | 3400 ops took 1.019  seconds |
| ECDSA [SECP256R1] 256    sign | 3300 ops took 1.027  seconds |
| ECDSA [SECP256R1] 256  verify | 5000 ops took 1.011  seconds |
| CURVE 25519           key gen | 49929 ops took 1.000 seconds |
| CURVE 25519             agree | 51500 ops took 1.000 seconds |

> Benchmark complete 

> /app/src/wolfssl-5.6.6/wolfcrypt/benchmark/benchmark  
> wolfSSL version 5.6.6 with AESNI with SP-MATH  
> Math:   Single Precision: ecc 256 384 521 rsa/dh 2048 3072 4096 asm sp_x86_64.c  
> wolfCrypt Benchmark (block bytes 1048576, min 1.0 sec each)  

|  |  |  |
|:---|---:|---:|
| RNG                           |    235 MiB took 1.011 seconds |
| AES-128-CBC-enc               |   2210 MiB took 1.002 seconds |
| AES-128-CBC-dec               |  14675 MiB took 1.000 seconds |
| AES-192-CBC-enc               |   1880 MiB took 1.002 seconds |
| AES-192-CBC-dec               |  12215 MiB took 1.000 seconds |
| AES-256-CBC-enc               |   1625 MiB took 1.001 seconds |
| AES-256-CBC-dec               |  10575 MiB took 1.000 seconds |
| AES-128-GCM-enc               |   8900 MiB took 1.000 seconds |
| AES-128-GCM-dec               |   8915 MiB took 1.000 seconds |
| AES-192-GCM-enc               |   8105 MiB took 1.001 seconds |
| AES-192-GCM-dec               |   8150 MiB took 1.000 seconds |
| AES-256-GCM-enc               |   7435 MiB took 1.000 seconds |
| AES-256-GCM-dec               |   7480 MiB took 1.001 seconds |
| GMAC Table 4-bit              |   2300 MiB took 1.000 seconds |
| AES-128-CTR                   |    940 MiB took 1.004 seconds |
| AES-192-CTR                   |    875 MiB took 1.005 seconds |
| AES-256-CTR                   |    820 MiB took 1.003 seconds |
| CHACHA                        |   3855 MiB took 1.001 seconds |
| CHA-POLY                      |   2650 MiB took 1.001 seconds |
| MD5                           |    935 MiB took 1.002 seconds |
| POLY1305                      |   8305 MiB took 1.000 seconds |
| SHA                           |    945 MiB took 1.002 seconds |
| SHA-224                       |    570 MiB took 1.007 seconds |
| SHA-256                       |    570 MiB took 1.009 seconds |
| SHA-384                       |    875 MiB took 1.001 seconds |
| SHA-512                       |    875 MiB took 1.006 seconds |
| SHA-512/224                   |    875 MiB took 1.003 seconds |
| SHA-512/256                   |    875 MiB took 1.003 seconds |
| SHA3-224                      |    595 MiB took 1.008 seconds |
| SHA3-256                      |    565 MiB took 1.009 seconds |
| SHA3-384                      |    430 MiB took 1.003 seconds |
| SHA3-512                      |    300 MiB took 1.004 seconds |
| HMAC-MD5                      |    935 MiB took 1.003 seconds |
| HMAC-SHA                      |    950 MiB took 1.003 seconds |
| HMAC-SHA224                   |    570 MiB took 1.008 seconds |
| HMAC-SHA256                   |    565 MiB took 1.007 seconds |
| HMAC-SHA384                   |    870 MiB took 1.001 seconds |
| HMAC-SHA512                   |    880 MiB took 1.001 seconds |
| PBKDF2                        |     64 KiB took 1.000 seconds |
| RSA   2048            key gen |     34 ops took 1.027 seconds |
| RSA   2048             public |  90200 ops took 1.001 seconds |
| RSA   2048            private |   2700 ops took 1.015 seconds |
| DH    2048            key gen |   5432 ops took 1.000 seconds |
| DH    2048              agree |   5500 ops took 1.008 seconds |
| ECC   [SECP256R1] 256 key gen | 109300 ops took 1.000 seconds |
| ECDHE [SECP256R1] 256   agree |  29200 ops took 1.000 seconds |
| ECDSA [SECP256R1] 256    sign |  71700 ops took 1.000 seconds |
| ECDSA [SECP256R1] 256  verify |  27600 ops took 1.001 seconds |
| CURVE 25519           key gen |  49427 ops took 1.000 seconds |
| CURVE 25519             agree |  50900 ops took 1.000 seconds |

> Benchmark complete
