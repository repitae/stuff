```sh
MIPINTR=`ip -4 -o addr show scope global | awk -F ' *|/' '{print $2}'`
MIPADDR=`ip -4 -o addr show scope global | awk -F ' *|/' '{print $4}'`
```

```sh
cat << EOF | sudo tee /opt/pxe/seed/ase17reg.cfg
# preseed
d-i preseed/early_command string echo "Preseed Starting"

# mirror
#d-i mirror/protocol string http
#d-i mirror/country string manual
#d-i mirror/http/hostname string dl.astralinux.ru
#d-i mirror/http/directory string /astra/stable/1.7_x86-64/repository-main
#d-i mirror/http/proxy string

# local
d-i mirror/protocol string http
d-i mirror/country string manual
d-i mirror/http/hostname string $MIPADDR
d-i mirror/http/directory string /dist/alse17/
d-i mirror/http/proxy string

# locale
d-i debian-installer/locale string en_US.UTF-8
d-i debian-installer/locale select en_US.UTF-8
d-i debian-installer/language string en
d-i debian-installer/country string RU
d-i debian-installer/keymap string en

# console
#d-i console-tools/archs skip-config
d-i console-tools/archs select at
d-i console-keymaps-at/keymap select ru
d-i console-setup/toggle string Alt+Shift
d-i console-setup/layoutcode string ru

# keyboard
d-i keyboard-configuration/toggle select Alt+Shift
d-i keyboard-configuration/layoutcode string ru
d-i keyboard-configuration/xkb-keymap select ru

# country
d-i countrychooser/country-name select Russia

# netcfg
d-i netcfg/choose_interface select auto

# firmware
d-i hw-detect/load_firmware boolean false
d-i hw-detect/load_firmware select true

# debconf
#d-i debconf/priority string critical

# apt-setup
d-i apt-setup/non-free boolean true
d-i apt-setup/contrib boolean true
d-i apt-setup/services-select multiselect none

# timezone
d-i time/zone string Europe/Moscow

# clock
d-i clock-setup/utc boolean true
d-i clock-setup/ntp boolean true
d-i clock-setup/ntp-server string pool.ntp.org

# partman
d-i partman-auto/choose_recipe select All files in one partition (recommended for new users)
d-i partman-auto/method string regular
d-i partman/confirm boolean true
d-i partman/confirm_nooverwrite boolean true
d-i partman/confirm_write_new_label string true

#d-i partman-auto/method string lvm
#d-i partman-auto/purge_lvm_from_device boolean true
#d-i partman-auto/purge_lvm_from_device string true
#d-i partman-auto-crypto/erase_disks boolean true
#d-i partman-auto-lvm/guided_size string max
#d-i partman-basicfilesystems/no_swap boolean false
#d-i partman-lvm/confirm boolean true
#d-i partman-lvm/vgdelete_confirm boolean true
#d-i partman-md/confirm boolean true

d-i partman/choose_partition select Finish partitioning and write changes to disk
d-i partman-partitioning/confirm_write_new_label boolean true
d-i partman-partitioning/unknown_label boolean true
d-i partman-target/mount_failed boolean true

# image
d-i base-installer/kernel/image string linux-image-5.15-generic

# user
d-i passwd/make-user boolean true
d-i passwd/username string usr
d-i passwd/user-fullname string usr
d-i passwd/user-password-crypted password $1$XLJi9.Sn$MrqL634Qcr/flIrA5OIul/

# taskel
tasksel tasksel/first multiselect SSH server
tasksel tasksel/astra-feat-setup multiselect

# security
d-i astra-additional-setup/os-check select Base security level Orel
d-i astra-additional-setup/additional-settings-orel multiselect Disable ptrace capability
d-i astra-additional-setup/additional-settings multiselect

# astra-license
astra-license astra-license/license boolean true

# popularity-contest
popularity-contest popularity-contest/participate boolean false

# grub-installer
grub-installer grub-installer/choose_bootdev select /dev/sda
d-i grub-pc/install_devices multiselect /dev/sda
d-i grub-installer/only_debian boolean true
d-i grub-installer/with_other_os boolean true
d-i grub-installer/password-crypted password $1$HheOqSVS$N1YprVqRqdVMqBcJ80GQc.

# late_command
d-i preseed/late_command string \
 in-target apt -y install open-vm-tools ssh sudo; \
 echo "Preseed Ending";

# finish-install
d-i finish-install/reboot_in_progress note
d-i finish-install/exit/poweroff boolean true

EOF
```

