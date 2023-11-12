```sh
mkdir -p /opt/pxe/boot/{tmp,deb12}
cd /opt/pxe/boot/tmp
```

```sh
wget http://ftp.debian.org/debian/dists/bookworm/main/installer-amd64/current/images/netboot/netboot.tar.gz
tar -xvf ./netboot.tar.gz
```

```sh
sudo cp /opt/pxe/boot/tmp/debian-installer/amd64/linux /opt/pxe/boot/deb12/linux
sudo cp /opt/pxe/boot/tmp/debian-installer/amd64/initrd.gz /opt/pxe/boot/deb12/initrd.gz
```

```sh
rm -rf /opt/pxe/boot/tmp
```
