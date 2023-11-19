```sh
find /opt/pxe -type d -print0 | xargs -0 chmod 0775
find /opt/pxe -type f -print0 | xargs -0 chmod 0664
```
