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
```
echo "show stat" | sudo socat stdio /app/haproxy/run/haproxy.sock
watch 'echo "show stat" | sudo socat stdio /app/haproxy/run/haproxy.sock | cut -d "," -f 1-2,5-10,34-36 | column -s, -t'
echo "show sess all" | sudo socat /app/haproxy/run/haproxy.sock stdio
echo "show info;show stat" | sudo socat /app/haproxy/run/haproxy.sock stdio
```
```
cd /app/src
git clone https://github.com/tsenart/vegeta
cd vegeta
go get -u github.com/mailru/easyjson/...
export GOPATH=~qwe/go
export PATH=$GOPATH/bin:$PATH
make vegeta
mv vegeta /app/vegeta
```
```
ulimit -n 100000
ulimit -t 100000
ulimit -c 100000
```
```
echo "GET https://192.168.1.175:8083/" | /app/vegeta -cpus=4 attack -duration=10s -rate=10000 -workers=500 -insecure | tee rip.bin | /app/vegeta report
echo "GET https://192.168.1.177:8083/" | /app/vegeta -cpus=4 attack -duration=10s -rate=10000 -workers=500 -insecure | tee rip.bin | /app/vegeta report
echo "GET https://192.168.1.179:8083/" | /app/vegeta -cpus=4 attack -duration=10s -rate=10000 -workers=500 -insecure | tee rip.bin | /app/vegeta report
```
```
curl -kvi https://192.168.1.175:8083/
curl -kvi https://192.168.1.177:8083/
curl -kvi https://192.168.1.179:8083/
```
```
ab -t 10 -c 1000 -n 1000 https://192.168.1.175:8083/ # openssl-3.1.4
ab -t 10 -c 1000 -n 1000 https://192.168.1.177:8083/ # openssl-3.2.0
ab -t 10 -c 1000 -n 1000 https://192.168.1.179:8083/ # wolfssl-5.6.6
```
```
wrk -c1000 -d10s https://192.168.1.175:8083/ # openssl-3.1.4
wrk -c1000 -d10s https://192.168.1.177:8083/ # openssl-3.2.0
wrk -c1000 -d10s https://192.168.1.179:8083/ # wolfssl-5.6.6
```
