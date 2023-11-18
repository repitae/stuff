```sh
[ ! -d /opt/pxe ] && sudo mkdir -m 777 -p /opt/pxe/{boot,dist,seed}
cd /opt/pxe
```

```sh
wget http://boot.ipxe.org/ipxe.efi
wget http://boot.ipxe.org/ipxe.pxe
wget http://boot.ipxe.org/ipxe.png
```

```sh
cat << EOF | sudo tee /opt/pxe/boot.ipxe 
#!ipxe

dhcp && goto netboot || goto dhcperror

:dhcperror
prompt --key s --timeout 10000 DHCP Failed, hit 's' for iPXE shell; reboot in 10 seconds && shell || reboot

:netboot
chain http://192.168.1.21/boot.cfg ||
prompt --key s --timeout 10000 Hit 's' for iPXE shell; reboot in 10 seconds && shell || reboot
EOF
```

```sh
cat << EOF | sudo tee /opt/pxe/boot.cfg
#!ipxe

cpuid --ext 29 && set arch x64 || set arch x86
cpuid --ext 29 && set archl amd64 || set archl i386

set base http://192.168.1.21

:start
menu iPXE Boot Menu
item
item --gap Reg Partition:
item ase17reg    [REG] Astra SE 17
item ace21reg    [REG] Astra CE 21
item deb12reg    [REG] Debian 12
item
item ase17lvm    [LVM] Astra SE 17
item ace21lvm    [LVM] Astra CE 21
item deb12lvm    [LVM] Debian 12
item
item --gap PXE Options:
item config      [PXE] Config
item shell       [PXE] Shell
item reboot      [PXE] Reboot
item exit        [PXE] Exit
item

set menu-timeout 0
choose os || goto cancel 
# choose --timeout 9999 --default deb12reg os || goto cancel
goto ${os}

:shell
echo Type 'exit' to get the back to menu
shell
set menu-timeout 0
set submenu-timeout 0
goto start

:cancel
echo Menu cancelled, dropping to shell
goto shell

:failed
echo Booting failed, dropping to shell
goto shell

:reboot
reboot

:exit
exit

:config
config
goto start

:ase17reg
kernel ${base}/boot/ase17/linux hostname=ase domain=lz auto=true url=${base}/seed/ase17reg.cfg ipv6.disable=1 modprobe.blacklist=evbug,i2c-piix4 net.ifnames=0 astra-license/license=true astra_install=1 debian-installer/allow_unauthenticated=true
initrd ${base}/boot/ase17/initrd.gz
boot || goto failed
goto start

:ace21reg
kernel ${base}/boot/ace21/linux hostname=ace domain=lz auto=true url=${base}/seed/ace21reg.cfg ipv6.disable=1 modprobe.blacklist=evbug,i2c-piix4 net.ifnames=0 astra-license/license=true astra_install=1 debian-installer/allow_unauthenticated=true
initrd ${base}/boot/ace21/initrd.gz
boot || goto  failed
goto start

:deb12reg
kernel ${base}/boot/deb12/linux hostname=deb domain=lz auto=true url=${base}/seed/deb12reg.cfg ipv6.disable=1
initrd ${base}/boot/deb12/initrd.gz
boot || goto failed
goto start

:ase17lvm
kernel ${base}/boot/ase17/linux hostname=ase domain=lz auto=true url=${base}/seed/ase17lvm.cfg ipv6.disable=1 modprobe.blacklist=evbug,i2c-piix4 net.ifnames=0 astra-license/license=true astra_install=1 debian-installer/allow_unauthenticated=true
initrd ${base}/boot/ase17/initrd.gz
boot || goto failed
goto start

:ace21lvm
kernel ${base}/boot/ace21/linux hostname=ace domain=lz auto=true url=${base}/seed/ace21lvm.cfg ipv6.disable=1 modprobe.blacklist=evbug,i2c-piix4 net.ifnames=0 astra-license/license=true astra_install=1 debian-installer/allow_unauthenticated=true
initrd ${base}/boot/ace21/initrd.gz
boot || goto  failed
goto start

:deb12lvm
kernel ${base}/boot/deb12/linux hostname=deb domain=lz auto=true url=${base}/seed/deb12lvm.cfg ipv6.disable=1
initrd ${base}/boot/deb12/initrd.gz
boot || goto failed
goto start
EOF
```
