```
sudo tee /etc/logrotate.d/suricata > /dev/null << 'EOF'
/opt/oisf/suricata/var/log/suricata/*.log
{
    size 100M
    rotate 7
    compress
    missingok
    notifempty
    sharedscripts
    postrotate
        if [ -f /opt/oisf/suricata/var/run/suricata/suricata.pid ]; then
            kill -HUP $(/opt/oisf/suricata/var/run/suricata/suricata.pid) 2>/dev/null || true
        else
            systemctl restart suricata
        fi
    endscript
}
EOF
sudo logrotate -dvf /etc/logrotate.d/suricata
```