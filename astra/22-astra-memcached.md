## memcache
```sh
export APP=app ; export SRC=src ; export MEMC=memcached
mv /$APP/$MEMC /$APP/$MEMC.old
cd /$APP/$SRC

wget http://www.memcached.org/files/memcached-1.6.21.tar.gz
tar xvf ./memcached-1.6.21.tar.gz
cd ./memcached-1.6.21/

./configure --prefix=/$APP/$MEMC --enable-64bit
[[ $? -eq 0 ]] && make -j $(nproc)
[[ $? -eq 0 ]] && make test
[[ $? -eq 0 ]] && make install
[[ $? -eq 0 ]] && mkdir -p /$APP/$MEMC/etc
[[ -n $(id -u "$MEMC" 2>/dev/null) ]] || useradd -M -U -r -s `which nologin` -d /$APP/$MEMC $MEMC
chown -R $MEMC:$MEMC /$APP/$MEMC
```

```sh
[[ -f "/etc/systemd/system/memcached.service" ]] || sudo cp /app/src/memcached-1.6.21/scripts/memcached.service \
/etc/systemd/system/memcached.service

[[ -f "/etc/systemd/system/memcached.service" ]] || sudo sed -i 's/\/etc\/sysconfig\/memcached/\/app\/memcached\/etc\/memcached/' \
/etc/systemd/system/memcached.service

[[ -f "/etc/systemd/system/memcached.service" ]] || sudo sed -i 's/\/usr\/bin\/memcached/\/app\/memcached\/bin\/memcached/' \
/etc/systemd/system/memcached.service

[[ -f "/app/memcached/etc/memcached" ]] || cp /app/src/memcached-1.6.21/scripts/memcached.sysconfig \
/app/memcached/etc/memcached

sed -i.bak 's/nobody/memcached/' /app/memcached/etc/memcached
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable memcached.service
sudo systemctl restart memcached.service
sudo journalctl -xe -u memcached
```

```sh
nc 127.0.0.1 11211 << END
stats
quit
END
```
