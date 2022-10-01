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
cd /app/polaris/bin/
./polaris-memcache-control 127.0.0.1 get-generic-state
./polaris-memcache-control 127.0.0.1 get-ppdns-state
./polaris-health status
./polaris-health start-debug
````