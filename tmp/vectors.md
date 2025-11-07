Rapid Reset = RST_STREAM (0x3) фрейм (отмены потока) = утилизация ресурсов
Сontinuation Flood = (0x9) фрейм не закрывая END_HEADERS (0x4) = положить одной сессией
MadeYouReset = crafted invalid control frames (WINDOW_UPDATE>2^31-1; PRIORITY len != 5, PRI on itself)

Rapid Reset (RST_STREAM) CVE-2023-44487
CONTINUATION Flood CVE-2024-27316
4MadeYouReset CVE-2025-8671

HTTP/1.1 must die: the desync endgame James Kettle, September 2025
PortSwigger

sudo tshark -Y "tls.handshake" \
 -E separator=';' -T fields \
 -e ip.src -e ip.dst \
 -e tls.handshake.ja3 \
 -e tls.handshake.ja3_full \
 -e tls.handshake.ja3s \
 -e tls.handshake.ja3s_full \
 -e tls.handshake.ja4 \
 -e tls.handshake.ja4_r

sudo iptables -I FORWARD -j NFQUEUE --queue-num 0
https://github.com/vncloudsco/suricata-rules/blob/main/emerging-ja3.rules
suricata -c suricata.yaml -S alert.rules :
https://github.com/lwthiker/ts1.

Canvas Fingerprinting
Audio Fingerprinting (AudioContext API)
TLS CSS Canvas WebAudio Fingerprinting
JS Challenge

Token Sidejacking -> JWT Verification
https://jwtdecode.dev/

[Base64(HEADER)].[Base64(PAYLOAD)].[Base64(SIGNATURE)]

HEADER: {"alg": "HS256","typ": "JWT"}
PAYLOAD: {"score": "89","bot": "false"}

HTTP Vectors:
HTTP/2 MadeYouReset CVE-2025-8671
HTTP/2 Rapid Reset CVE-2023-44487
HTTP/2 CONTINUATION Flood (type=0x9)

DNS Vectors:
Random Subdomain Attack
QTYPE=ANY Flood (RFC8482)
HTTP Request Smuggling
https://http1mustdie.com/
