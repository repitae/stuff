```sh
mkdir -p /media/cdrom/{alce,alse}
mkdir -p -m 0777 /opt/pxe/boot/{alce,alse}
```

```sh
cd /opt/pxe/boot/tmp
sudo mount alce-2.12.46.6-17.04.2023_15.09.iso /media/cdrom/alce
sudo mount installation-1.7.4.11-23.06.23_17.13.iso /media/cdrom/alse
```

```sh
sudo cp -r /media/cdrom/alce/* /opt/pxe/dist/alce21
sudo cp -r /media/cdrom/alse/* /opt/pxe/dist/alse17
```

```sh
sudo umount /media/cdrom/alce
sudo umount /media/cdrom/alse
```
