\### Что нужно:



* Проверить дампы
* Определить векторы
* Ответ прислать в личку
* Формат: номер дампа - вектор



\## Naming

01-amp.dns.RRSIG.fragmented

02-amp.TCP.reflection.SYNACK

03-amp.UDP.DNSANY

04-amp.UDP.IOT.port37810.JSON

05-amp.UDP.isakmp

06-amp.UDP.memcached.ntp.cldap

07-pkt.ICMP.largeempty

08-pkt.IPV4.randomprotofield

09-pkt.TCP.synflood.spoofed

10-pkt.UDP.fragmented

11-amp.TCP.syn.optionallyACK.optionallysamePort

12-amp.UDP.bacnet.IOT.37810

13-amp.UDP.manyprotocols

14-amp.UDP.snmp.src161

15-amp.UDP.UBNT.src10001

16-pkt.TCP.DOMINATE.syn.ecn.cwr

17-pkt.UDP.null

18-pkt.UDP.rdm.fixedlength



\## Anonymizing

Open capture in wireshark and write a display filter:

example `udp \&\& ip.dst == 10.10.10.10 \&\& udp.dstport == 8080`.

Then file > export specified packets write a new filtered pcap



With tcpreplay's tcprewrite:



```bash

for file in $(ls);

&#x20; do tcprewrite --infile=$file --outfile=/root/anonymous/$file --dstipmap=0.0.0.0/0:10.10.10.10;

done

```



