## quictls
```sh
export APP=app ; export SRC=src ; export QTLS=quictls

cd /$APP/$SRC/
wget https://github.com/quictls/openssl/archive/refs/heads/openssl-3.0.5+quic.zip
unzip ./openssl-3.0.5+quic.zip
cd ./openssl-openssl-3.0.5-quic/

./Configure --prefix=/app/quictls --openssldir=ssl enable-ktls no-deprecated
[[ $? -eq 0 ]] && make -j $(nproc)
[[ $? -eq 0 ]] && make test
[[ $? -eq 0 ]] && make install

echo /app/quictls/lib64 | tee -a /etc/ld.so.conf.d/quictls.conf && ldconfig
ldconfig -p | grep quictls
/$APP/$QTLS/bin/openssl version -a

useradd -M -U -r -s `which nologin` -d /$APP/$QTLS $QTLS
chown -R $QTLS:$QTLS /$APP/$QTLS
```
