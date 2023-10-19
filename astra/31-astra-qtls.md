## QuicTLS
```sh
export APP=app ; export SRC=src ; export QTLS=qtls
```
```sh
cd /$APP/$SRC/
#wget https://github.com/quictls/openssl/archive/refs/tags/openssl-3.0.10-quic1.tar.gz -O openssl-3.0.10-quic1.tar.gz
#tar xvf ./openssl-3.0.10-quic1.tar.gz && cd ./openssl-openssl-3.0.10-quic1/
wget https://github.com/quictls/openssl/archive/refs/tags/openssl-3.1.2-quic1.tar.gz -O openssl-3.1.2-quic1.tar.gz
```
```sh
[[ $? -eq 0 ]] && tar xvf ./openssl-3.1.2-quic1.tar.gz
[[ $? -eq 0 ]] && cd ./openssl-3.1.2-quic1/
[[ $? -eq 0 ]] && make clean
[[ $? -eq 0 ]] && ./Configure --prefix=/app/qtls --openssldir=ssl enable-ktls no-deprecated no-legacy
[[ $? -eq 0 ]] && make -j $(nproc)
[[ $? -eq 0 ]] && make test 
[[ $? -eq 0 ]] && make install_sw
```
```sh
# echo /app/qtls/lib64 | tee -a /etc/ld.so.conf.d/qtls.conf
# ldconfig && ldconfig -p | grep qtls
# /$APP/$QTLS/bin/openssl version -a
```
```sh
useradd -M -U -r -s `which nologin` -d /$APP/$QTLS $QTLS
chown -R $QTLS:$QTLS /$APP/$QTLS
```
