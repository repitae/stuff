```sh
sudo mkdir -p /media/cdrom/{alce,alse}
sudo mkdir -p -m 0777 /opt/pxe/{boot,dist}/{ace21,ase17}
[ ! -d /opt/pxe/boot/ipxe ] && sudo mkdir -m 0777 -p /opt/pxe/boot/ipxe
cd /opt/pxe/boot/ipxe
```

```sh
sudo mount alce-2.12.46.6-17.04.2023_15.09.iso /media/cdrom/alce
sudo mount alse-1.7.4.11-23.06.23_17.13.iso /media/cdrom/alse
```

```sh
[ -d /opt/pxe/dist/ace21 ] && sudo cp -r /media/cdrom/alce/* /opt/pxe/dist/ace21
[ -d /opt/pxe/dist/ase17 ] && sudo cp -r /media/cdrom/alse/* /opt/pxe/dist/ase17
```

```sh
sudo umount /media/cdrom/alce
sudo umount /media/cdrom/alse
```

```sh
find /opt/pxe -type d -print0 | xargs -0 chmod 0777
find /opt/pxe -type f -print0 | xargs -0 chmod 0666
```

```sh
rm -rf /opt/pxe/boot/ipxe/*
rm -rf /media/cdrom/{alce,alse}
```

