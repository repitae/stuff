|Item|Value|Description|
|---|---|---|
backend-queries | 10 | Number of queries sent to the backend(s)
corrupt-packets | 0 | Number of corrupt packets received
deferred-cache-inserts | 0 | Amount of cache inserts that were deferred because of maintenance
deferred-cache-lookup | 0 | Amount of cache lookups that were deferred because of maintenance
deferred-packetcache-inserts | 0 | Amount of packet cache inserts that were deferred because of maintenance
deferred-packetcache-lookup | 0 | Amount of packet cache lookups that were deferred because of maintenance
dnsupdate-answers | 0 | DNS update packets successfully answered.
dnsupdate-changes | 0 | DNS update changes to records in total.
dnsupdate-queries | 0 | DNS update packets received.
dnsupdate-refused | 0 | DNS update packets that are refused.
incoming-notifications | 0 | NOTIFY packets received.
noerror-packets | 0 | Number of times a NOERROR packet was sent out
nxdomain-packets | 0 | Number of times an NXDOMAIN packet was sent out
overload-drops | 0 | Queries dropped because backends overloaded
packetcache-hit | 0 | Number of hits on the packet cache
packetcache-miss | 0 | Number of misses on the packet cache
packetcache-size | 0 | Number of entries in the packet cache
query-cache-hit | 0 | Number of hits on the query cache
query-cache-miss | 0 | Number of misses on the query cache
query-cache-size | 0 | Number of entries in the query cache
rd-queries | 0 | Number of recursion desired questions
recursing-answers | 0 | Number of recursive answers sent out
recursing-questions | 0 | Number of questions sent to recursor
recursion-unanswered | 0 | Number of packets unanswered by configured recursor
security-status | 1 | Security status based on regular polling
servfail-packets | 0 | Number of times a server-failed packet was sent out
signatures | 0 | Number of DNSSEC signatures made
tcp-answers | 0 | Number of answers sent out over TCP
tcp-answers-bytes | 0 | Total size of answers sent out over TCP
tcp-cookie-queries | 0 | Number of TCP queries received with the COOKIE option
tcp-queries | 0 | Number of TCP queries received
tcp4-answers | 0 | Number of IPv4 answers sent out over TCP
tcp4-answers-bytes | 0 | Total size of answers sent out over TCPv4
tcp4-queries | 0 | Number of IPv4 TCP queries received
tcp6-answers | 0 | Number of IPv6 answers sent out over TCP
tcp6-answers-bytes | 0 | Total size of answers sent out over TCPv6
tcp6-queries | 0 | Number of IPv6 TCP queries received
timedout-packets | 0 | Number of packets which weren't answered within timeout set
udp-answers | 0 | Number of answers sent out over UDP
udp-answers-bytes | 0 | Total size of answers sent out over UDP
udp-cookie-queries | 0 | Number of UDP queries received with the COOKIE EDNS option
udp-do-queries | 0 | Number of UDP queries received with DO bit
udp-queries | 0 | Number of UDP queries received
udp4-answers | 0 | Number of IPv4 answers sent out over UDP
udp4-answers-bytes | 0 | Total size of answers sent out over UDPv4
udp4-queries | 0 | Number of IPv4 UDP queries received
udp6-answers | 0 | Number of IPv6 answers sent out over UDP
udp6-answers-bytes | 0 | Total size of answers sent out over UDPv6
udp6-queries | 0 | Number of IPv6 UDP queries received
unauth-packets | 0 | Number of times a zone we are not auth for was queried
zone-cache-hit | 0 | Number of zone cache hits
zone-cache-miss | 0 | Number of zone cache misses
zone-cache-size | 1 | Number of entries in the zone cache
backend-latency | 0 | Average number of microseconds needed for a backend lookup
cache-latency | 0 | Average number of microseconds needed for a packet cache lookup
cpu-iowait | 1000 | Time spent waiting for I/O to complete by the whole system, in units of USER_HZ
cpu-steal | 0 | Stolen time, which is the time spent by the whole system in other operating systems when running in a virtualized environment, in units of USER_HZ
fd-usage | 10 | Number of open filedescriptors
key-cache-size | 0 | Number of entries in the key cache
latency | 0 | Average number of microseconds needed to answer a question
meta-cache-size | 0 | Number of entries in the metadata cache
open-tcp-connections | 0 | Number of currently open TCP connections
qsize-q | 0 | Number of questions waiting for database attention
real-memory-usage | 1000000 | Actual unique use of memory in bytes (approx)
receive-latency | 0 | Average number of microseconds needed to receive a query
ring-logmessages-capacity | 10000 | Maximum number of entries in the logmessages ring
ring-logmessages-size | 10 | Number of entries in the logmessages ring
ring-noerror-queries-capacity | 10000 | Maximum number of entries in the noerror-queries ring
ring-noerror-queries-size | 0 | Number of entries in the noerror-queries ring
ring-nxdomain-queries-capacity | 10000 | Maximum number of entries in the nxdomain-queries ring
ring-nxdomain-queries-size | 0 | Number of entries in the nxdomain-queries ring
ring-queries-capacity | 10000 | Maximum number of entries in the queries ring
ring-queries-size | 0 | Number of entries in the queries ring
ring-remotes-capacity | 10000 | Maximum number of entries in the remotes ring
ring-remotes-corrupt-capacity | 10000 | Maximum number of entries in the remotes-corrupt ring
ring-remotes-corrupt-size | 0 | Number of entries in the remotes-corrupt ring
ring-remotes-size | 0 | Number of entries in the remotes ring
ring-remotes-unauth-capacity | 10000 | Maximum number of entries in the remotes-unauth ring
ring-remotes-unauth-size | 0 | Number of entries in the remotes-unauth ring
ring-servfail-queries-capacity | 10000 | Maximum number of entries in the servfail-queries ring
ring-servfail-queries-size | 0 | Number of entries in the servfail-queries ring
ring-unauth-queries-capacity | 10000 | Maximum number of entries in the unauth-queries ring
ring-unauth-queries-size | 0 | Number of entries in the unauth-queries ring
send-latency | 0 | Average number of microseconds needed to send the answer
signature-cache-size | 0 | Number of entries in the signature cache
sys-msec | 10 | Number of msec spent in system time
udp-in-csum-errors | 0 | UDP 'in checksum' errors
udp-in-errors | 0 | UDP 'in' errors
udp-noport-errors | 100 | UDP 'noport' errors
udp-recvbuf-errors | 0 | UDP 'recvbuf' errors
udp-sndbuf-errors | 0 | UDP 'sndbuf' errors
udp6-in-csum-errors | 0 | UDP 'in checksum' errors over IPv6
udp6-in-errors | 0 | UDP 'in' errors over IPv6
udp6-noport-errors | 0 | UDP 'noport' errors over IPv6
udp6-recvbuf-errors | 0 | UDP 'recvbuf' errors over IPv6
udp6-sndbuf-errors | 0 | UDP 'sndbuf' errors over IPv6
uptime | 10 | Uptime of process in seconds
user-msec | 10 | Number of msec spent in user time
xfr-queue | 0 | Size of the queue of zones to be XFRd
