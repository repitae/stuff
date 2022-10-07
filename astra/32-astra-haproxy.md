## haproxy
```sh
export APP=app ; export SRC=src ; export QTLS=quictls ; export HAPRO=haproxy

export HMIN="TARGET=linux-glibc \
    USE_OPENSSL=1 \
    USE_LUA=1 \
    USE_PCRE=1 \
    USE_PCRE_JIT=1 \
    USE_SYSTEMD=1" # minimal build

export HFAT="ARCH=64 CPU=generic TARGET=linux-glibc \
    USE_ACCEPT4=1 \
    USE_CPU_AFFINITY=1 \
    USE_DL=1 \
    USE_ENGINE=1 \
    USE_EPOLL=1 \
    USE_GETADDRINFO=1 \
    USE_LIBCRYPT=1 \
    USE_LIBCRYPT_CRYPT_H=1 \
    USE_LINUX_SPLICE=1 \
    USE_LINUX_TPROXY=1 \
    USE_LUA=1 \
    USE_NETFILTER=1 \
    USE_NS=1 \
    USE_OPENSSL=1 \
    USE_PCRE=1 \
    USE_PRCTL=1 \
    USE_PCRE_JIT=1 \
    USE_QUIC=1 \
    USE_RT=1 \
    USE_SLZ=1 \
    USE_STATIC_PCRE=1 \
    USE_SYSTEMD=1 \
    USE_TFO=1 \
    USE_THREAD=1 \
    USE_THREAD_DUMP=1 \
    USE_TPROXY=1 \
    SSL_LIB=/app/quictls/lib64/ \
    SSL_INC=/app/quictls/include/ "

export HOPT="ARCH=64 CPU=generic TARGET=linux-glibc \
    USE_ENGINE=1 \
    USE_GETADDRINFO=1 \
    USE_LIBCRYPT=1 \
    USE_LIBCRYPT_CRYPT_H=1 \
    USE_LUA=1 \
    USE_NS=1 \
    USE_OPENSSL=1 \
    USE_PCRE=1 \
    USE_PCRE_JIT=1 \
    USE_QUIC=1 \
    USE_STATIC_PCRE=1 \
    USE_SYSTEMD=1 \
    USE_TFO=1 \
    USE_THREAD=1 \
    SSL_LIB=/app/quictls/lib64/ \
    SSL_INC=/app/quictls/include/ "

cd /$APP/$SRC/
HAVER=$(curl -S https://www.haproxy.org/download/2.6/src/releases.json | grep latest_release | cut -d '"' -f 4) && echo $HAVER
wget https://www.haproxy.org/download/2.6/src/haproxy-$HAVER.tar.gz
tar xvf ./haproxy-$HAVER.tar.gz && cd ./haproxy-$HAVER/

# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/$APP/$QTLS/lib64 && echo $LD_LIBRARY_PATH
# make help TARGET=linux-glibc

make clean
make -j $(nproc) $HOPT
[[ $? -eq 0 ]] && make install PREFIX=/$APP/$HAPRO
/$APP/$HAPRO/sbin/haproxy -vv

useradd -M -U -r -s `which nologin` -d /$APP/$HAPRO $HAPRO
chown -R $HAPRO:$HAPRO /$APP/$HAPRO
```
