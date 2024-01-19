#!/bin/sh

set -e
set -v

ENVOY_GRP=envoy
ENVOY_USR=envoy
ENVOY_ELF=envoy
ENVOY_PFX=envoy-proxy
ENVOY_DIR=/app/$ENVOY_PFX
ENVOY_BIN=$ENVOY_DIR/bin
ENVOY_ETC=$ENVOY_DIR/etc
ENVOY_LOG=$ENVOY_DIR/log
ENVOY_RUN=$ENVOY_DIR/run
ENVOY_URL=https://github.com/envoyproxy/envoy/releases/download/v1.28.0/envoy-1.28.0-linux-x86_64

mk_fail() {
    echo 'command failed';
    exit 1;
}

mk_dirs() {
if [[ -d {$ENVOY_BIN,$ENVOY_ETC,$ENVOY_LOG,$ENVOY_RUN} ]]; then
    mkdir -p {$ENVOY_BIN,$ENVOY_ETC,$ENVOY_LOG,$ENVOY_RUN}
    echo "mk_dirs done"
fi
echo "mk_dirs fail"
}

mk_group() {
if ! getent group $ENVOY_GRP >/dev/null; then
    addgroup --system $ENVOY_GRP >/dev/null
    echo "mk_group done"
fi
echo "mk_group fail"
}

mk_user() {
if ! getent passwd $ENVOY_USR >/dev/null; then
    sudo adduser \
        --system \
        --disabled-login \
        --ingroup $ENVOY_GRP \
        --no-create-home \
        --home /nonexistent \
        --gecos "Envoy User" \
        --shell /bin/false \
        $ENVOY_USR  >/dev/null
    echo "mk_user done"
fi
echo "mk_user fail"
}

mk_dload() {
if [[ -f $ENVOY_BIN/$ENVOY_ELF ]]; then
    curl -o $ENVOY_BIN/$ENVOY_ELF -L $ENVOY_URL
    echo "mk_dload done"
fi
echo "mk_dload fail"
}

mk_default() {
if [[ -f $ENVOY_ETC/defaults ]]; then
cat << EOF | tee $ENVOY_ETC/defaults
BIN=/app/envoy-proxy/etc/envoy
CONFIG=--config-path /app/envoy-proxy/etc/config.yaml
VERIFY=--mode validate
EOF
echo "mk_default done"
fi
echo "mk_default fail"
}

mk_socket() {
if [[ -f /etc/systemd/system/envoy-proxy.socket ]]; then
cat << EOF | sudo tee /etc/systemd/system/envoy-proxy.socket
[Unit]
Description=Envoy Socket %i

[Socket]
User=envoy
ListenStream=/app/envoy-proxy/run/envoy.sock

[Install]
WantedBy=sockets.target
EOF
echo "mk_socket done"
fi
echo "mk_socket fail"
}

mk_service() {
if [[ -f /etc/systemd/system/envoy-proxy.service ]]; then
cat << EOF | sudo tee /etc/systemd/system/envoy-proxy.service
[Unit]
Description=Envoy Proxy %i
After=network-online.target
Wants=network-online.target

[Service]
Type=notify
User=envoy
EnvironmentFile=/app/envoy-proxy/etc/defaults
ExecStartPre=$BIN $VERIFY $CONFIG
ExecStart=$BIN $CONFIG
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
echo "mk_service done"
fi
echo "mk_service fail"
}

mk_systemd() {
sudo systemctl daemon-reload
sudo systemctl --failed
sudo systemctl reset-failed
sudo cat /var/log/messages | grep -i -A2 failed
}

rm_user() {
if getent group $ENVOY_GRP >/dev/null; then
    delgroup --system $ENVOY_GRP >/dev/null
fi
}
rm_user() {
if getent passwd $ENVOY_USR >/dev/null; then
    deluser $ENVOY_USR  >/dev/null
fi
}

mk_install() {
    sudo su - envoy -s /bin/bash
    echo "mk_dirs"
    mk_dirs
    echo "mk_group"
    mk_group
    echo "mk_user"
    mk_user
    echo "mk_dload"
    mk_dload
    echo "mk_default"
    mk_default
    echo "mk_socket"
    mk_socket
    echo "mk_service"
    mk_service
    echo "mk_systemd"
    mk_systemd
}

case "$1" in
    install)
        mk_install
        ;;

    uninstall)
        echo rm_user
        echo rm_group
        ;;

    *)
        echo "called with unknown argument \`$1'" >&2
        exit 0
        ;;
esac
exit 0
}
