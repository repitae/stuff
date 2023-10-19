## haproxy
```sh
export APP=app ; export SRC=src ; export QTLS=qtls; export WTLS=wssl ; export HAPRO=haproxy
```
```sh
export HMIN="ARCH=64 CPU=generic TARGET=linux-glibc \
    USE_SYSTEMD=1 " # minimal build
```
```sh
export OTLS="ARCH=64 CPU=generic TARGET=linux-glibc \
    USE_CRYPT_H=1 \
    USE_ENGINE=1 \
    USE_LIBCRYPT=1 \
    USE_LUA=1 \
    USE_NS=1 \
    USE_OPENSSL=1 \
    USE_PCRE_JIT=1 \
    USE_PCRE=1 \
    USE_STATIC_PCRE=1 \
    USE_SYSTEMD=1 \
    USE_TFO=1 \
    USE_THREAD=1 " # openssl buils
```
```sh
export QTLS="ARCH=64 CPU=generic TARGET=linux-glibc \
    USE_CRYPT_H=1 \
    USE_ENGINE=1 \
    USE_LIBCRYPT=1 \
    USE_LUA=1 \
    USE_NS=1 \
    USE_OPENSSL=1 \
    USE_PCRE_JIT=1 \
    USE_PCRE=1 \
    USE_QUIC=1 \
    USE_STATIC_PCRE=1 \
    USE_SYSTEMD=1 \
    USE_TFO=1 \
    USE_THREAD=1 \
    SSL_LIB=/app/qtls/lib64/ \
    SSL_INC=/app/qtls/include/ " # quictls build
```
```sh
export WTLS="ARCH=64 CPU=generic TARGET=linux-glibc \
    USE_CRYPT_H=1 \
    USE_ENGINE=1 \
    USE_LIBCRYPT=1 \
    USE_LUA=1 \
    USE_NS=1 \
    USE_OPENSSL_WOLFSSL=1 \
    USE_OPENSSL=1 \
    USE_PCRE_JIT=1 \
    USE_PCRE=1 \
    USE_QUIC=1 \
    USE_STATIC_PCRE=1 \
    USE_SYSTEMD=1 \
    USE_TFO=1 \
    USE_THREAD=1 \
    SSL_LIB=/app/wssl/lib/ \
    SSL_INC=/app/wssl/include/ " # wolfssl build
```

```sh
cd /$APP/$SRC/
wget https://github.com/wolfSSL/wolfssl/archive/refs/tags/v5.6.3-stable.tar.gz -O wolfssl-5.6.3-stable.tar.gz 
[[ $? -eq 0 ]] && tar xvf ./wolfssl-5.6.3-stable.tar.gz
[[ $? -eq 0 ]] && cd ./wolfssl-5.6.3-stable/
[[ $? -eq 0 ]] && ./autogen.sh
[[ $? -eq 0 ]] && ./configure --help
[[ $? -eq 0 ]] && ./configure --enable-haproxy --enable-quic --prefix=/$APP/$WTLS
[[ $? -eq 0 ]] && make -j $(nproc)
[[ $? -eq 0 ]] && make install
```

```sh
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/$APP/$QTLS/lib64 && echo $LD_LIBRARY_PATH
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/$APP/$WTLS/lib && echo $LD_LIBRARY_PATH
# make help TARGET=linux-glibc
```

```sh
cd /$APP/$SRC/
HAVER=$(curl -s https://www.haproxy.org/download/2.8/src/releases.json | grep latest_release | cut -d '"' -f 4) && echo $HAVER
wget https://www.haproxy.org/download/2.8/src/haproxy-$HAVER.tar.gz
```
```sh
[[ $? -eq 0 ]] && tar xvf ./haproxy-$HAVER.tar.gz
[[ $? -eq 0 ]] && cd ./haproxy-$HAVER/
[[ $? -eq 0 ]] && make clean
[[ $? -eq 0 ]] && make -j $(nproc) $OTLS
# [[ $? -eq 0 ]] && make -j $(nproc) $HMIN
# [[ $? -eq 0 ]] && make -j $(nproc) $QTLS
# [[ $? -eq 0 ]] && make -j $(nproc) $WTLS
[[ $? -eq 0 ]] make install PREFIX=/$APP/$HAPRO
/$APP/$HAPRO/sbin/haproxy -vv
```
```sh
useradd -M -U -r -s `which nologin` -d /$APP/$HAPRO $HAPRO
chown -R $HAPRO:$HAPRO /$APP/$HAPRO
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
sudo systemctl daemon-reload
sudo systemctl enable haproxy
sudo systemctl start haproxy
sudo systemctl status haproxy
sudo systemctl list-units --failed
sudo journalctl --flush --rotate --vacuum-time=1m
```