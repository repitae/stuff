```
/interface disable lte1
/interface lte firmware-upgrade lte1
/interface lte firmware-upgrade lte1 upgrade=yes
/interface lte firmware-upgrade lte1 upgrade=yes firmware-file=image
#status: done
/interface enable lte1
/interface lte firmware-upgrade lte1
/interface lte at-chat lte1 input="AT+CHECKATUPGRADE"
```
```
#IP nat rule:
/ip firewall nat add action=masquerade chain=srcnat out-interface=lte1
#IPv4 mangle rule:
/ip firewall mangle
add action=change-ttl chain=postrouting new-ttl=set:65 out-interface=lte1 passthrough=yes
#IPv6 mangle rule:
/ipv6 firewall mangle
add action=change-hop-limit chain=postrouting new-hop-limit=set:65 passthrough=yes
```
```
/interface lte at-chat lte1 input="at+cfun?"
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
/interface lte monitor lte1
/interface lte cell-monitor lte1
```
```
/file print
/system package print
/log print without-paging
/system reboot
```
```
curl https://upgrade.mikrotik.com/firmware/R11eL-FG621-EA/latest
https://gregory-gost.ru/menyaem-imei-dlya-r11e-lte-r11e-4g-r11e-lte6-i-eg12-ea-chateau-lte12/
```