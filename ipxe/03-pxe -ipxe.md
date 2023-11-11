```sh
sudo mkdir -m 777 -p /opt/pxe/{boot,dist,seed}
cd /opt/pxe
```

```sh
wget http://boot.ipxe.org/ipxe.efi
wget http://boot.ipxe.org/ipxe.pxe
wget http://boot.ipxe.org/ipxe.png
wget http://boot.ipxe.org/texture.png
```

```sh
find /opt/pxe -type d -print0 | xargs -0 chmod 0777
find /opt/pxe -type f -print0 | xargs -0 chmod 0666
```