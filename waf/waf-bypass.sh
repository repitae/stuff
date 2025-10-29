git clone https://github.com/nemesida-waf/waf_bypass.git /opt/waf-bypass/
sudo  apt install python3-venv
python3 -m venv /opt/waf-bypass/
./bin/python3 -m pip install -r ./requirements.txt
./bin/python3 /opt/waf-bypass/main.py --host='www.example.com'
