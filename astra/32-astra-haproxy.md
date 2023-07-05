## haproxy
```sh
export APP=app ; export SRC=src ; export QTLS=quictls; export WTLS=wolfssl ; export HAPRO=haproxy

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
    USE_TPROXY=1 # fat build

export OTLS="ARCH=64 CPU=generic TARGET=linux-glibc \
    USE_ENGINE=1 \
    USE_GETADDRINFO=1 \
    USE_LIBCRYPT=1 \
    USE_LIBCRYPT_CRYPT_H=1 \
    USE_LUA=1 \
    USE_NS=1 \
    USE_OPENSSL=1 \
    USE_PCRE=1 \
    USE_PCRE_JIT=1 \
    USE_STATIC_PCRE=1 \
    USE_SYSTEMD=1 \
    USE_TFO=1 \
    USE_THREAD=1 \ " openssl buils

export QTLS="ARCH=64 CPU=generic TARGET=linux-glibc \
    USE_ACCEPT4=1 \
    USE_CPU_AFFINITY=1 \
    USE_DL=1 \
    USE_ENGINE=1 \
    USE_EPOLL=1 \
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
    USE_THREAD_DUMP=1 \
    USE_TPROXY=1 \
    SSL_LIB=/app/quictls/lib64/ \
    SSL_INC=/app/quictls/include/ " quictls build

export WTLS="ARCH=64 CPU=generic TARGET=linux-glibc \
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
    USE_OPENSSL_WOLFSSL=1 \
    SSL_LIB=/app/wolfssl/lib/ \
    SSL_INC=/app/wolfssl/include/ " # wolfssl build

cd /$APP/$SRC/
wget https://github.com/wolfSSL/wolfssl/archive/refs/tags/v5.6.3-stable.tar.gz -O wolfssl-5.6.3-stable.tar.gz 
tar xvf ./wolfssl-5.6.3-stable.tar.gz && cd ./wolfssl-5.6.3-stable/
./autogen.sh
./configure --help
./configure --enable-haproxy --enable-quic --prefix=/app/wolfssl/
make -j $(nproc)
make install

cd /$APP/$SRC/
HAVER=$(curl -s https://www.haproxy.org/download/2.8/src/releases.json | grep latest_release | cut -d '"' -f 4) && echo $HAVER
wget https://www.haproxy.org/download/2.8/src/haproxy-$HAVER.tar.gz
tar xvf ./haproxy-$HAVER.tar.gz && cd ./haproxy-$HAVER/

# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/$APP/$QTLS/lib64 && echo $LD_LIBRARY_PATH
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/$APP/$WTLS/lib && echo $LD_LIBRARY_PATH
# make help TARGET=linux-glibc

make clean
make -j $(nproc) $WTLS
[[ $? -eq 0 ]] && make install PREFIX=/$APP/$HAPRO
/$APP/$HAPRO/sbin/haproxy -vv

useradd -M -U -r -s `which nologin` -d /$APP/$HAPRO $HAPRO
chown -R $HAPRO:$HAPRO /$APP/$HAPRO
```
