```sh
sudo apt install tftpd-hpa pxelinux syslinux vsftpd
```

```sh
sudo apt install isc-dhcp-server
```

```sh
cp /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.arch
cat << EOF | sudo tee /etc/dhcp/dhcpd.conf
authoritative;
ddns-update-style none;
use-host-decl-names on;

option domain-name "lz";
option domain-name-servers 1.1.1.1;
option arch code 93 = unsigned integer 16;
option architecture code 93 = unsigned integer 16 ;

option space ipxe;
option ipxe.no-pxedhcp = 1;
option ipxe.no-pxedhcp code 176 = unsigned integer 8;

max-lease-time 7200;
default-lease-time 600;

subnet 192.168.1.0 netmask 255.255.255.0 {
 range 192.168.1.200 192.168.1.250;
 option domain-name-servers 1.1.1.1;
 option domain-name "lz";
 option routers 192.168.1.1;
 option broadcast-address 192.168.1.255;
}

if option arch != 00:00 {
 filename "ipxe.efi";
} else {
 filename "undionly.kpxe";
}

next-server 192.168.1.21;
option tftp-server-name "192.168.1.21";
option root-path "tftp://192.168.1.21:/srv/tftp/";
EOF
```

```sh
dhcpd -t -cf /etc/dhcp/dhcpd.conf && systemctl restart isc-dhcp-server.service
```

```sh                                         	
sudo apt install isolinux mkisofs ca-certificates build-essential liblzma-dev
wget -q -O master.zip https://github.com/ipxe/ipxe/archive/refs/heads/master.zip
unzip master.zip
cd ./ipxe-master/src
make
make bin/undionly.kpxe
make bin-x86_64-efi/ipxe.efi
```
