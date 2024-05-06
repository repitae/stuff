```
/ip firewall nat 
add chain=srcnat action=masquerade out-interface-list=WAN ipsec-policy=out,none 
/ip firewall mangle
add action=change-ttl chain=postrouting new-ttl=set:65 out-interface=lte1 passthrough=yes
add action=change-ttl chain=postrouting new-ttl=set:65 out-interface-list=WAN passthrough=yes
/ipv6 firewall mangle
add action=change-hop-limit chain=postrouting new-hop-limit=set:65 passthrough=yes
```

```
/interface lte at-chat lte1 input="at+qcfg=?" wait=yes
/interface disable lte1
/interface enable lte1
/interface lte firmware-upgrade lte1
/interface lte firmware-upgrade lte1 upgrade=yes
/interface lte firmware-upgrade lte1 upgrade=yes firmware-file=image
/interface lte firmware-upgrade lte1
/interface lte at-chat lte1 input="AT+reset"
/interface lte at-chat lte1 input="AT+RSTSET"
/interface lte at-chat lte1 input="AT+CHECKATUPGRADE"
/interface lte monitor lte1
/interface lte cell-monitor lte1  
```

```
/interface lte at-chat lte1 input="AT+CFUN?"
/interface lte at-chat lte1 input="AT+GTCCINFO?"
#/interface lte at-chat lte1 input="AT*Cell=0"
```
```
/interface lte at-chat lte1 input="AT*PROD=2"
/interface lte at-chat lte1 input="AT*MRD_IMEI=R"
/interface lte at-chat lte1 input="AT*MRD_IMEI=D"
/interface lte at-chat lte1 input="AT*MRD_IMEI=W,0101,11JAN1970,359043379117515"
/interface lte at-chat lte1 input="AT*MRD_IMEI=W,0,01JAN1970,359043373245882"
/interface lte at-chat lte1 input="AT*MRD_IMEI\?"
/interface lte at-chat lte1 input="AT*PROD=0"
/interface lte at-chat lte1 input="AT+RESET"
```
```
/system logging add topics=lte
/log print without-paging
```

```
/file print
/system package print
/system reboot
```

```
/system package update
check-for-updates once
:delay 3s;
:if ( [get status] = "New version is available") do={ install }
```

```
curl https://upgrade.mikrotik.com/firmware/R11eL-FG621-EA/latest
https://gregory-gost.ru/menyaem-imei-dlya-r11e-lte-r11e-4g-r11e-lte6-i-eg12-ea-chateau-lte12/
```