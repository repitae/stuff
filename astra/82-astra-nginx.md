## nginx

```sh
sudo apt install -y nginx-light
```

```sh
cat <<EOF > /var/www/html/index.html
<html>
<head>
<title>Hostname: $(hostname)</title>
</head>
<body>
<div align="center">
<h1>$(hostname)</h1>
<hr />
<h2>
<?php
echo $_SERVER['PHP_SELF'];
echo $_SERVER['SERVER_NAME'];
echo $_SERVER['HTTP_HOST'];
echo $_SERVER['HTTP_REFERER'];
echo $_SERVER['HTTP_USER_AGENT'];
echo $_SERVER['SCRIPT_NAME'];
?>
</h2>
<br />
<h2>
<script type="text/javascript">
var host = location.host;
document.write("SERVER_ADDR: ", host);
</script>
</h2>
<hr />
<h5>
<script type="text/javascript">
const now = new Date();
document.write(now);
</script>
</h5>
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