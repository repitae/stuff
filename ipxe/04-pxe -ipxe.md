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
MIPINTR=`ip -4 -o addr show scope global | awk -F ' *|/' '{print $2}'`
MIPADDR=`ip -4 -o addr show scope global | awk -F ' *|/' '{print $4}'`
```

```sh
cat << EOF | sudo tee /opt/pxe/boot.ipxe 
#!ipxe

dhcp && goto netboot || goto dhcperror

:dhcperror
prompt --key s --timeout 10000 DHCP Failed, hit 's' for iPXE shell; reboot in 10 seconds && shell || reboot

:netboot
chain http://$MIPADDR/boot.cfg ||
prompt --key s --timeout 10000 Hit 's' for iPXE shell; reboot in 10 seconds && shell || reboot
EOF
```

```sh
cat << EOF | sudo tee /opt/pxe/boot.cfg
#!ipxe

cpuid --ext 29 && set arch x64 || set arch x86
cpuid --ext 29 && set archl amd64 || set archl i386

set base http://$MIPADDR
set kargs modprobe.blacklist=evbug,i2c-piix4 hostname=lh domain=lz auto=true ipv6.disable=1
set astra net.ifnames=0 astra-license/license=true astra_install=1 debian-installer/allow_unauthenticated=true
set menu-timeout 0
set submenu-timeout 0

:start
menu iPXE Boot Menu
item --gap Regular Partition:
item ase17reg    [REG] Astra SE 17
item ace21reg    [REG] Astra CE 21
item deb12reg    [REG] Debian 12
item --gap LMV Partition:
item ase17lvm    [LVM] Astra SE 17
item ace21lvm    [LVM] Astra CE 21
item deb12lvm    [LVM] Debian 12
item --gap PXE Options:
item config      [PXE] Config
item shell       [PXE] Shell
item reboot      [PXE] Reboot
item exit        [PXE] Exit
item

choose os || goto shell
# choose --timeout 9999 --default deb12reg os || goto shell
goto \${os}

:shell
echo type 'exit' to get back
shell
goto start

:reboot
reboot

:exit
exit

:config
config
goto start

:ase17reg
kernel \${base}/boot/ase17/linux \$kargs \$astra url=\${base}/seed/ase17reg.cfg
initrd \${base}/boot/ase17/initrd.gz
boot || goto shell
goto start

:ase17lvm
kernel \${base}/boot/ase17/linux \$kargs \$astra url=\${base}/seed/ase17lvm.cfg
initrd \${base}/boot/ase17/initrd.gz
boot || goto shell
goto start

:ace21reg
kernel \${base}/boot/ace21/linux \$kargs \$astra url=\${base}/seed/ace21reg.cfg
initrd \${base}/boot/ace21/initrd.gz
boot || goto shell
goto start

:ace21lvm
kernel \${base}/boot/ace21/linux \$kargs \$astra url=\${base}/seed/ace21lvm.cfg
initrd \${base}/boot/ace21/initrd.gz
boot || goto shell
goto start

:deb12reg
kernel \${base}/boot/deb12/linux \$kargs url=\${base}/seed/deb12reg.cfg
initrd \${base}/boot/deb12/initrd.gz
boot || goto shell
goto start

:deb12lvm
kernel \${base}/boot/deb12/linux \$kargs url=\${base}/seed/deb12lvm.cfg
initrd \${base}/boot/deb12/initrd.gz
boot || goto shell
goto start
EOF
```
