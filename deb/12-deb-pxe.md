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
allow booting;
allow bootp;
ddns-update-style none;

option fqdn.no-client-update on; 
option fqdn.rcode2 255;
option pxegrub code 150 = text ;
 
next-server 192.168.1.21;
option architecture code 93 = unsigned integer 16 ;
if option architecture = 00:07 {
 filename "bootx64.efi";
}
elsif option architecture = 00:09 {
 filename "bootx64.efi";
}
else {
 filename "pxelinux.0";
}
 
subnet 192.168.1.0 netmask 255.255.255.0 {
    range 192.168.1.200 192.168.1.250;
    option broadcast-address 192.168.1.255;
    option routers 192.168.1.1;
    option subnet-mask 255.255.255.0;
} 

use-host-decl-names on;
EOF
```

```sh                                         	
sudo apt install isolinux mkisofs ca-certificates build-essential
wget -q -O master.zip https://github.com/ipxe/ipxe/archive/refs/heads/master.zip && unzip master.zip
cd ./ipxe-master/src
make
make bin/undionly.kpxe
make bin-x86_64-efi/ipxe.efi
```
