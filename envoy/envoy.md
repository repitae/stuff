### path
```
[[ -d /app/envoy-proxy/{etc,bin,log,run} ]] ||  mkdir -p /app/envoy-proxy/{etc,bin,log,run}
[[ -d /app/envoy-contrib/{etc,bin,log,run} ]] ||  mkdir -p /app/envoy-contrib/{etc,bin,log,run}
```

### binaries
```
curl -s -o /app/envoy-proxy/bin/envoy \
  -L https://github.com/envoyproxy/envoy/releases/download/v1.28.0/envoy-1.28.0-linux-x86_64

curl -s -o /app/envoy-contrib/bin/envoy \
  -L https://github.com/envoyproxy/envoy/releases/download/v1.28.0/envoy-contrib-1.28.0-linux-x86_64
```

### defaults
```
cat << EOF | tee /app/envoy-contrib/etc/defaults
BIN=/app/envoy-contrib/etc/envoy
CONFIG=--config-path /app/envoy-contrib/etc/config.yaml
VERIFY=--mode validate
EOF
```

### socket
```
cat << EOF | sudo tee /etc/systemd/system/envoy-contrib.socket
[Unit]
Description=Envoy RPC Socket

[Socket]
User=envoy
ListenStream=/app/envoy-contrib/run/rpc.sock

[Install]
WantedBy=sockets.target
EOF
```

### service
```
cat << EOF | sudo tee /etc/systemd/system/envoy-contrib
[Unit]
Description=Envoy %i
After=network-online.target
Wants=network-online.target

[Service]
Type=notify
User=envoy
EnvironmentFile=-/app/envoy-contrib/etc/defaults
ExecStartPre=/app/envoy-contrib/bin/envoy --mode validate -c /app/envoy-contrib/etc/proxy.yaml
ExecStart=/app/envoy-contrib/bin/envoy -c /app/envoy-contrib/etc/proxy.yaml
ExecReload=/bin/kill -HUP $MAINPID
ExecStop=/bin/kill -TERM $MAINPID
StartLimitInterval=0
TimeoutStopSec=5
KillMode=mixed
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF
```

### systemd
```
sudo systemctl daemon-reload
systemctl --failed
systemctl reset-failed
sudo cat /var/log/messages | grep -i -A2 failed
```

### user and group
```
#! /bin/sh

set -e

add_user() {
    if ! getent group envoy >/dev/null; then
        addgroup --system envoy >/dev/null
    fi

    if ! getent passwd envoy >/dev/null; then
        adduser \
          --system \
          --disabled-login \
          --ingroup envoy \
          --no-create-home \
          --home /nonexistent \
          --gecos "envoy user" \
          --shell /bin/false \
          envoy  >/dev/null

    fi
}

rem_user() {
    if getent group envoy >/dev/null; then
        delgroup --system envoy >/dev/null
	fi
	
	if getent passwd envoy >/dev/null; then
	    deluser envoy  >/dev/null
	fi
}

case "$1" in
    install)
        add_user
        ;;

    uninstall)
	    rem_user
        ;;

    *)
        echo "called with unknown argument \`$1'" >&2
        exit 0
        ;;
esac

exit 0
```
