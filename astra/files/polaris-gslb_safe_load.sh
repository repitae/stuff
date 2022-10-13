#
# change in __init.py__
# yaml.load() to yaml.safe_load()
#
su - polaris
git clone https://github.com/polaris-gslb/polaris-gslb.git
cd ./polaris-gslb/

sudo pip uninstall polaris-gslb

sed -i -e 's/yaml.load/yaml.safe_load/' ./polaris_pdns/__init__.py
sed -i -e 's/yaml.load/yaml.safe_load/' ./polaris_health/guardian/__init__.py
sed -i -e 's/yaml.load/yaml.safe_load/' ./build/lib/polaris_pdns/__init__.py
sed -i -e 's/yaml.load/yaml.safe_load/' ./build/lib/polaris_health/guardian/__init__.py

export POLARIS_INSTALL_PREFIX=/app/polaris
python3 setup.py install