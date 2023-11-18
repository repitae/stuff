```sh
sudo apt update
sudo apt install -y isc-dhcp-server
```

```sh
cat << EOF | sudo tee /etc/dhcp/ipxe-options.conf
# Declare the iPXE/gPXE/Etherboot option space
option space ipxe;
option ipxe-encap-opts code 175 = encapsulate ipxe;

# iPXE options, can be set in DHCP response packet
option ipxe.priority         code   1 = signed integer 8;
option ipxe.keep-san         code   8 = unsigned integer 8;
option ipxe.skip-san-boot    code   9 = unsigned integer 8;
option ipxe.syslogs          code  85 = string;
option ipxe.cert             code  91 = string;
option ipxe.privkey          code  92 = string;
option ipxe.crosscert        code  93 = string;
option ipxe.no-pxedhcp       code 176 = unsigned integer 8;
option ipxe.bus-id           code 177 = string;
option ipxe.san-filename     code 188 = string;
option ipxe.bios-drive       code 189 = unsigned integer 8;
option ipxe.username         code 190 = string;
option ipxe.password         code 191 = string;
option ipxe.reverse-username code 192 = string;
option ipxe.reverse-password code 193 = string;
option ipxe.version          code 235 = string;
option iscsi-initiator-iqn   code 203 = string;

# iPXE feature flags, set in DHCP request packet
option ipxe.pxeext    code 16 = unsigned integer 8;
option ipxe.iscsi     code 17 = unsigned integer 8;
option ipxe.aoe       code 18 = unsigned integer 8;
option ipxe.http      code 19 = unsigned integer 8;
option ipxe.https     code 20 = unsigned integer 8;
option ipxe.tftp      code 21 = unsigned integer 8;
option ipxe.ftp       code 22 = unsigned integer 8;
option ipxe.dns       code 23 = unsigned integer 8;
option ipxe.bzimage   code 24 = unsigned integer 8;
option ipxe.multiboot code 25 = unsigned integer 8;
option ipxe.slam      code 26 = unsigned integer 8;
option ipxe.srp       code 27 = unsigned integer 8;
option ipxe.nbi       code 32 = unsigned integer 8;
option ipxe.pxe       code 33 = unsigned integer 8;
option ipxe.elf       code 34 = unsigned integer 8;
option ipxe.comboot   code 35 = unsigned integer 8;
option ipxe.efi       code 36 = unsigned integer 8;
option ipxe.fcoe      code 37 = unsigned integer 8;
option ipxe.vlan      code 38 = unsigned integer 8;
option ipxe.menu      code 39 = unsigned integer 8;
option ipxe.sdi       code 40 = unsigned integer 8;
option ipxe.nfs       code 41 = unsigned integer 8;

# http://www.ietf.org/assignments/dhcpv6-parameters/dhcpv6-parameters.txt
option arch code 93 = unsigned integer 16;
EOF
```

```sh
MIPADDR=`ip -4 -o addr show scope global | awk -F ' *|/' '{print $4}'`
```

```sh
cat << EOF | sudo tee /etc/dhcp/ipxe-clients.conf
# https://git.ipxe.org/ipxe.git/commitdiff/af9afd0a86aeac1eed28b5028c3de669515fc7fc
# https://git.ipxe.org/ipxe.git/blob/HEAD:/src/include/ipxe/dhcp.h#l275
# https://www.rfc-editor.org/errata_search.php?rfc=4578

allow bootp;
allow booting;
next-server $MIPADDR;
option ipxe.no-pxedhcp 1;

# Make sure iPXE features support
# If not load a full-featured version.

if    exists ipxe.http
  and exists ipxe.menu
  and (
        ( exists ipxe.pxe
      and exists ipxe.bzimage
      and exists ipxe.elf
        ) or (
          exists ipxe.efi
        )
      ) {
    filename "http://$MIPADDR/boot.ipxe";
} elsif option arch = 00:09 { # EFI BC
} elsif option arch = 00:08 { # EFI Xscale
} elsif option arch = 00:07 { filename "ipxe.efi"; 
} elsif option arch = 00:06 { # Intel x86 32-bit
} elsif option arch = 00:05 { # Intel Lean Client
} elsif option arch = 00:04 { # Arc x86
} elsif option arch = 00:03 { # DEC Alpha
} elsif option arch = 00:02 { # EFI Itanium
} elsif option arch = 00:01 { # NEC/PC98
} elsif option arch = 00:00 { filename "ipxe.pxe";
}
EOF
```

```sh
sudo cp /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.dist
cat << EOF | sudo tee /etc/dhcp/dhcpd.conf
authoritative;
ddns-update-style none;
use-host-decl-names on;

include "/etc/dhcp/ipxe-options.conf";

subnet 192.168.1.0 netmask 255.255.255.0 {
    range 192.168.1.210 192.168.1.250;
    option subnet-mask 255.255.255.0;
    option routers 192.168.1.1;
    option domain-name "lz";
    option domain-search "lz";
    option domain-name-servers 1.1.1.1;
    option ntp-servers 192.168.1.1;
    include "/etc/dhcp/ipxe-clients.conf";
    default-lease-time 60;
    max-lease-time 90;
}
EOF
```

```sh
sudo dhcpd -t -cf /etc/dhcp/dhcpd.conf
sudo systemctl enable isc-dhcp-server
sudo systemctl restart isc-dhcp-server
sudo systemctl status isc-dhcp-server
```