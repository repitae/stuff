## polaris
```sh
sudo ln -s `which pip3` `which pip3 | sed 's/3//'`
```

```sh
export APP=app ; export SRC=src ; export PMODS=python
mkdir -p /$APP/$PMODS/ && cd /$APP/$PMODS/

python3 -m venv /$APP/$PMODS/
source /$APP/$PMODS/bin/activate
```

```sh
pip install wheel -t /$APP/$PMODS/
pip install pyyaml -t /$APP/$PMODS/
pip uninstall python-memcache
pip uninstall python-daemon-3K
pip install pymemcache -t /$APP/$PMODS/
pip install python-daemon -t /$APP/$PMODS/
deactivate
```

```sh
export APP=app ; export SRC=src ; export PMODS=python ; export POLAR=polaris
cd /$APP/$SRC

git clone https://github.com/polaris-gslb/polaris-gslb.git
cd ./polaris-gslb/

export PATH=$PATH:/$APP/$PMODS/bin
export POLARIS_INSTALL_PREFIX=/$APP/$POLAR
python3 setup.py install

useradd -M -U -r -s `which nologin` -d /$APP/$POLAR $POLAR
chown -R $POLAR:$POLAR /$APP/$POLAR
```

```sh
sed -i -e 's/yaml.load/yaml.safe_load/' ./polaris_pdns/__init__.py
sed -i -e 's/yaml.load/yaml.safe_load/' ./polaris_health/guardian/__init__.py
sed -i -e 's/yaml.load/yaml.safe_load/' ./build/lib/polaris_pdns/__init__.py
sed -i -e 's/yaml.load/yaml.safe_load/' ./build/lib/polaris_health/guardian/__init__.py
```

```sh
cat << EOF >> /$APP/$POLAR/etc/polaris-lb.yaml
pools:
    www-example:
        monitor: tcp
        monitor_params:
            port: 22
        lb_method: twrr
        fallback: any
        members:
        - ip: 192.0.2.1
          name: www-dc1
          weight: 1
        - ip: 192.0.2.2
          name: www-dc2
          weight: 1

globalnames:
    www.example.com:
        pool: www-example
        ttl: 1
EOF
```

```sh
cat << EOF >> /$APP/$POLAR/etc/polaris-lb.yaml

```

```sh
cd /app/polaris/bin/
./polaris-memcache-control 127.0.0.1 get-generic-state
./polaris-memcache-control 127.0.0.1 get-ppdns-state
./polaris-health status
./polaris-health start-debug
````