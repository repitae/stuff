```
cd /app/src/ #https://github.com/shekyan/slowhttptest/releases/tag/v1.9.0
wget https://github.com/shekyan/slowhttptest/archive/refs/tags/v1.9.0.tar.gz
tar -xzvf v1.9.0.tar.gz
cd slowhttptest-1.9.0/
./configure --prefix=/app/slowhttp
make
sudo make install
```
```
./slowhttptest -c 1000 -H -g -o my_header_stats -i 10 -r 200 -t GET -u https://myseceureserver/resources/index.html -x 24 -p 3
./slowhttptest -c 1000 -B -g -o my_body_stats -i 110 -r 200 -s 8192 -t FAKEVERB -u https://myseceureserver/resources/loginform.html -x 10 -p 3
./slowhttptest -c 1000 -X -r 1000 -w 10 -y 20 -n 5 -z 32 -u http://192.168.1.175:8083/ -p 5 -l 350 -e x.x.x.x:8080
./slowhttptest -c 1000 -X -r 1000 -w 100 -y 200 -n 50 -z 32 -u http://192.168.1.175:8083/ -p 50 -l 350
```
```
./slowhttptest -X http://192.168.1.175:8083/
```
```
wrk -t4 -c1000 -d30s http://192.168.1.175:8084/ # traefik l4 proxy
wrk -t4 -c1000 -d30s http://192.168.1.175:8085/ # traefik l7 proxy
```
watch 'echo "show stat" | socat stdio /app/haproxy/run/.sock | cut -d "," -f 1-2,5-10,34-36 | column -s, -t'
echo "show sess" | socat /app/haproxy/run/haproxy.sock stdio
```