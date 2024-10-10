mkdir -p ./config/
mkdir -p ./influxdb/data/
mkdir -p ./kapacitor/data/
mkdir -p ./chronograf/data/

cat << EOF >> tick-default.env
TZ=Europe/Moscow

# token=(`tr -dc A-Za-z0-9 < /dev/urandom | head -c 31`); echo $token; echo $token | base64

INFLUXDB_ORG=org
INFLUXDB_BUCKET=web
INFLUXDB_RETENTION=4w
INFLUXDB_USERNAME=qwe
INFLUXDB_PASSWORD=qwe123qwe
INFLUXDB_URL=http://influxdb:8086
INFLUXDB_TOKEN=QlZuTlYwR1JtZndGU3JpcmJUYnVxRGoxSXpSMTBHMQo=

KAPACITOR_AS_ROOT=true
KAPACITOR_URL=http://kapacitor:9092
KAPACITOR_INFLUXDB_ENABLED=true
KAPACITOR_INFLUXDB_NAME=influxdb
KAPACITOR_INFLUXDB_0_USERNAME=$INFLUXDB_USERNAME
KAPACITOR_INFLUXDB_0_PASSWORD=$INFLUXDB_ADMIN_TOKEN
KAPACITOR_INFLUXDB_0_URLS_0=http://influxdb:8086

HOST_ETC=/hostfs/etc
HOST_PROC=/hostfs/proc
HOST_SYS=/hostfs/sys
HOST_VAR=/hostfs/var
HOST_RUN=/hostfs/run
HOST_MOUNT_PREFIX=/hostfs
EOF

cat << EOF >> tick-setup.env
INFLUX_ORG=org
INFLUX_BUCKET=web
INFLUX_RETENTION=4w
INFLUX_USERNAME=qwe
INFLUX_PASSWORD=qwe123qwe
INFLUX_TOKEN=QlZuTlYwR1JtZndGU3JpcmJUYnVxRGoxSXpSMTBHMQo=
EOF


docker compose up -d

export $(grep -v '^#' setup.env | xargs)

docker exec influxdb influx setup \
  -o $INFLUX_ORG \
  -b $INFLUX_BUCKET \
  -p $INFLUX_PASSWORD \
  -r $INFLUX_RETENTION \
  -t $INFLUX_TOKEN \
  -u $INFLUX_USERNAME \
  -f

#docker exec -it influxdb influx setup

