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
<h1>$(hostname)</h1>
<br />
<h1><?php echo "SERVER_ADDR: $_SERVER['SERVER_ADDR']"; ?></h1>
<h1><?php echo "REMOTE_ADDR: $_SERVER['REMOTE_ADDR']"; ?></h1>
<br />
<h1>
<script type="text/javascript">
document.write("SERVER_ADDR: ", location.host);
</script>
</h1>
<br />
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