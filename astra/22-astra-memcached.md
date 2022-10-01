## memcache
```sh
export APP=app ; export SRC=src ; export MEMC=memcached

cd /$APP/$SRC
wget http://www.memcached.org/files/memcached-1.6.17.tar.gz
tar xvf ./memcached-1.6.*.tar.gz
cd ./memcached-1.6.*/

./configure --prefix=/$APP/$MEMC --enable-64bit
[[ $? -eq 0 ]] && make -j $(nproc)
[[ $? -eq 0 ]] && make test
[[ $? -eq 0 ]] && make install

useradd -M -U -r -s `which nologin` -d /$APP/$MEMC $MEMC
chown -R $MEMC:$MEMC /$APP/$MEMC
```

```sh
sudo cp /app/src/memcached-1.6.17/scripts/memcached.service \
/etc/systemd/system/memcached.service

sudo sed -i 's/\/etc\/sysconfig\/memcached/\/app\/memcached\/etc\/memcached/' \
/etc/systemd/system/memcached.service

sudo sed -i 's/\/usr\/bin\/memcached/\/app\/memcached\/bin\/memcached/' \
/etc/systemd/system/memcached.service

cp /app/src/memcached-1.6.17/scripts/memcached.sysconfig \
/app/memcached/etc/memcached

sed -i.bak 's/nobody/memcached/' /app/memcached/etc/memcached
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable memcached.service
sudo systemctl start memcached.service
sudo journalctl -xe -u memcached
```

```sh
nc 127.0.0.1 11211 << END
stats
quit
END
```
