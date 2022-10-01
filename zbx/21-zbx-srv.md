## zbx
```sh
wget https://repo.zabbix.com/zabbix/6.3/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.3-1%2Bubuntu22.04_all.deb
sudo dpkg -i zabbix-release_6.3-1+ubuntu22.04_all.deb
apt update
sudo apt install -y zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-sql-scripts mysql-server
sudo apt install -y zabbix-get zabbix-agent2
```
```
mysql_secure_installation
```
```sql
mysql -uroot -p
create database zabbix character set utf8mb4 collate utf8mb4_bin;
create user zabbix@localhost identified by 'zabbix';
grant all privileges on zabbix.* to zabbix@localhost;
set global log_bin_trust_function_creators = 1;
quit;
```
```sh
zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -uzabbix -pzabbix zabbix
```
```
mysql -uroot -p -D zabbix -e "set global log_bin_trust_function_creators = 0;"
```
```
sudo sed -i.bak1 's/LogFileSize=0/LogFileSize=1/' /etc/zabbix/zabbix_agent2.conf
sudo sed -i.bak2 's/Hostname=Zabbix server/Hostname=zbx-esx-vm/' /etc/zabbix/zabbix_agent2.conf
```
```
sudo sed -i.bak 's/#DBPassword/DBPassword=zabbix/' /etc/zabbix/zabbix_server.conf
sudo cat << EOF >> /etc/php/8.1/apache2/conf.d/20-zbx.ini
# zabbix php settings
php_value[max_execution_time] = 300
php_value[memory_limit] = 128M
php_value[post_max_size] = 16M
php_value[upload_max_filesize] = 2M
php_value[max_input_time] = 300
php_value[max_input_vars] = 10000
php_value[always_populate_raw_post_data] = -1
php_value[date.timezone] = Europe/Moscow
EOF
```

```sh
systemctl restart zabbix-server zabbix-agent2 apache2
systemctl enable zabbix-server zabbix-agent2 apache2
```

## usr
```
#sudo useradd -r -d /var/lib/zabbix -s /sbin/nologin -M zabbix
#mkdir -m u=rwx,g=rwx,o= -p /var/lib/zabbix
#chown zabbix:zabbix /var/lib/zabbix
```

## ufw
```
ufw allow 10050/tcp
ufw allow 10051/tcp 
ufw allow 443/tcp
ufw allow 80/tcp
ufw reload 
```

## check
```sh
systemctl list-units --all --type=mount
systemctl list-units --type=service --state=failed
systemctl --failed

systemctl list-unit-files
systemctl list-unit-files --type=service
systemctl list-unit-files --type=service --state=enabled
systemctl list-unit-files --type=service --state=enabled,disabled
```