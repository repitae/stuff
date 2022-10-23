## nginx

```sh
sudo apt install -y nginx-light
```

```sh
cat <<EOF > /var/www/html/index.html
<html>
<head>
    <title>$(hostname)</title>
</head>
<body>
<div align="center">
<h1> hostname: $(hostname)</h1>
<h1> server ip: <? php echo $_SERVER['SERVER_ADDR']; ?> </h1>
<h1> client ip: <? php echo $_SERVER["REMOTE_ADDR"]; ?> </h2>
</div>
</body>
</html>
EOF
```

```sh
systemctl restart nginx
journalctr -xe
```


<!--# echo var="host" default="unknown_host" -->:<!--# echo var="server_port" default="unknown_port" -->