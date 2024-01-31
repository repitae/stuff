## wolfssl-5.6.6
```
cd /app/src/
rm -rf /app/src/wolfssl-5.6.6
[[ $? -eq 0 ]] && tar zxf ./wolfssl-5.6.6.tar.gz
cd /app/src/wolfssl-5.6.6
make clean
./configure --prefix=/app/wolfssl-5.6.6-all \
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
  --enable-sp-math-all \
  --enable-secure-renegotiation \
  --enable-session-ticket \
  --enable-supportedcurves \
  --enable-tls13 \
  --enable-tlsx \
  --disable-oldtls

make -j $(nproc) && make test
/app/src/wolfssl-5.6.6/wolfcrypt/benchmark/benchmark
make test && sudo make install
```

```
sudo apt install libsystemd-dev
```

## haproxy-2.8.5 wolfssl-5.6.6
```
cd /app/src/haproxy-2.8.5
make clean
# make -j $(nproc) CPU=generic ARCH=x86_64 TARGET=linux-glibc \
make -j $(nproc) TARGET=linux-glibc \
  USE_CRYPT_H=1 \
  USE_ENGINE=1 \
  USE_LIBCRYPT=1 \
  USE_NS=1 \
  USE_OPENSSL_WOLFSSL=1 \
  USE_QUIC=1 \
  USE_SYSTEMD=1 \
  USE_TFO=1 \
  USE_THREAD=1 \
  SSL_LIB=/app/wolfssl-5.6.6-all/lib \
  SSL_INC=/app/wolfssl-5.6.6-all/include \
  ADDLIB='-Wl,-rpath=/app/wolfssl-5.6.6-all/lib'
make install PREFIX=/app/haproxy-2.8.5-ws
ldd /app/haproxy-2.8.5-ws/sbin/haproxy
/app/haproxy-2.8.5-ws/sbin/haproxy -vv
ln -sf /app/haproxy-2.8.5-ws /app/haproxy-ws
[[ -d '/app/haproxy-ws/{etc,log,run,ssl}' ]] ||  mkdir -p /app/haproxy-ws/{etc,log,run,ssl}
```

## haproxy-2.8.5 openssl-3.2.0
```
cd /app/src/haproxy-2.8.5
make clean
# make -j $(nproc) CPU=generic ARCH=x86_64 TARGET=linux-glibc \
make V=1 -j $(nproc) TARGET=linux-glibc \
  USE_CRYPT_H=1 \
  USE_ENGINE=1 \
  USE_LIBCRYPT=1 \
  USE_NS=1 \
  USE_OPENSSL=1 \
  USE_QUIC=1 \
  USE_SYSTEMD=1 \
  USE_TFO=1 \
  USE_THREAD=1 \
  SSL_LIB=/app/openssl/lib64 \
  SSL_INC=/app/openssl/include \
  ADDLIB='-Wl,-rpath=/app/openssl/lib64'

make install PREFIX=/app/haproxy-2.8.5-openssl-3.2.0
ldd /app/haproxy-2.8.5-openssl-3.2.0/sbin/haproxy
/app/haproxy-2.8.5-openssl-3.2.0/sbin/haproxy -vv
[[ -d '/app/haproxy-2.8.5-openssl-3.2.0/{etc,log,run,ssl}' ]] ||  mkdir -p /app/haproxy-2.8.5-openssl-3.2.0/{etc,log,run,ssl}
```

## haproxy-2.8.5 openssl-3.1.4
```
cd /app/src/haproxy-2.8.5
make clean
make -j $(nproc) TARGET=linux-glibc \
  USE_CRYPT_H=1 \
  USE_ENGINE=1 \
  USE_LIBCRYPT=1 \
  USE_NS=1 \
  USE_OPENSSL=1 \
  USE_QUIC=1 \
  USE_SYSTEMD=1 \
  USE_TFO=1 \
  USE_THREAD=1 \
  SSL_LIB=/app/openssl-3.1.4-qc1/lib64 \
  SSL_INC=/app/openssl-3.1.4-qc1/include \
  ADDLIB="-Wl,-rpath=/app/openssl-3.1.4-qc1/lib64" \
  LDFLAGS="-Wl,-rpath=/app/openssl-3.1.4-qc1/lib64"

make install PREFIX=/app/haproxy-2.8.5-qc1
ldd /app/haproxy-2.8.5-qc1/sbin/haproxy
/app/haproxy-2.8.5-qc1/sbin/haproxy -vv
ln -sf /app/haproxy-2.8.5-qc1 /app/haproxy-qc1
[[ -d '/app/haproxy-qc1/{etc,log,run,ssl}' ]] ||  mkdir -p /app/haproxy-qc1/{etc,log,run,ssl}
```