## Update
```sh
sudo chmod -x /etc/update-motd.d/91-release-upgrade
```

## Create:
```sh
mkdir /opt/unetlab/addons/qemu/linux-debian-11.4.0/
cd /opt/unetlab/addons/qemu/linux-debian-11.4.0/
```

## Copy:
```sh
cd /opt/unetlab/addons/qemu/linux-debian-11.4.0/
cp ~/debian-11.4.0-amd64-netinst.iso ./cdrom.iso
```

## Create:
```sh
cd /opt/unetlab/addons/qemu/linux-debian-11.4.0/
/opt/qemu/bin/qemu-img create -f qcow2 virtioa.qcow2 16G
```

## Remove:
```sh
cd /opt/unetlab/addons/qemu/linux-debian-11.4.0/
rm -f cdrom.iso
```

## Commit:
```sh
cd /opt/unetlab/tmp/0/3491e0a7-25f8-46e1-b697-ccb4fc4088a2/8/
/opt/qemu/bin/qemu-img commit virtioa.qcow2
```

## Compress:
```sh
cd /opt/unetlab/addons/qemu/linux-debian-11.4.0/
eve-sparsify  --compress virtioa.qcow2 compressedvirtioa.qcow2
mv compressedvirtioa.qcow2 virtioa.qcow2
```

## Linux:
```sh
cd /opt/unetlab/addons/qemu/
tar xvfz ~/linux-CCIE-EI-Host-VM.tar.gz
tar xzvf ~/linux-ubuntu-22.04-server.tar.gz
tar xzvf ~/linux-metasploitable-2.0.0.tar.gz
/opt/unetlab/wrappers/unl_wrapper -a fixpermissions
````
