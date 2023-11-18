```sh
mkdir -m 0777 -p /opt/pxe/boot/deb12
[ ! -d /opt/pxe/boot/ipxe ] && sudo mkdir -m 0777 -p /opt/pxe/boot/ipxe
```

```sh
cd /opt/pxe/boot/ipxe
wget http://ftp.debian.org/debian/dists/bookworm/main/installer-amd64/current/images/netboot/netboot.tar.gz
tar -zxvf ./netboot.tar.gz ./debian-installer/amd64/linux
tar -zxvf ./netboot.tar.gz ./debian-installer/amd64/initrd.gz
```

```sh
cp /opt/pxe/boot/tmp/debian-installer/amd64/linux /opt/pxe/boot/deb12/linux
cp /opt/pxe/boot/tmp/debian-installer/amd64/initrd.gz /opt/pxe/boot/deb12/initrd.gz
```

```sh
rm -rf /opt/pxe/boot/ipxe/*
```
