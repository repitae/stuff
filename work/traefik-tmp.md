```
cd /app/src/
wget https://go.dev/dl/go1.20.13.linux-amd64.tar.gz
tar xzf go1.20.13.linux-amd64.tar.gz
[[ -d /usr/local/go ]] && sudo rm -rf /usr/local/go
sudo mv go /usr/local
sudo chown -R root:root /usr/local/go
```

```
export GO111MODULE=on
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin
```

```
mkdir -p ~/go/src/github.com/traefik
cd ~/go/src/github.com/traefik
git clone https://github.com/traefik/traefik
```

```
cd ./traefik/
/usr/local/go/bin/go env && go env
make clean-webui generate-webui
go generate
go build ./cmd/traefik
```

```
lld ~/go/src/github.com/traefik/traefik/traefik
ls ~/go/src/github.com/traefik/traefik
go test ./... || go test -v ./...
```