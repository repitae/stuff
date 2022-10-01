## zbx agent
```sh
apt install zabbix-agent
sudo sed -i.bak.1 's/LogFileSize=0/LogFileSize=1/' /etc/zabbix/zabbix_agentd.conf
sudo sed -i.bak.2 's/# Hostname=/Hostname=ase-esx-c2/' /etc/zabbix/zabbix_agentd.conf
sudo sed -i.bak.3 's/Server=127.0.0.1/Server=192.168.1.80/' /etc/zabbix/zabbix_agentd.conf
sudo sed -i.bak.4 's/ServerActive=127.0.0.1/ServerActive=192.168.1.80/' /etc/zabbix/zabbix_agentd.conf
systemctl restart zabbix-agent
```
## check
```sh
systemctl list-units --all --type=mount
systemctl list-units --type=service --state=failed
systemctl --failed

systemctl list-unit-files --type=service
systemctl list-unit-files --type=service --state=enabled
systemctl list-unit-files --type=service --state=enabled,disabled
```