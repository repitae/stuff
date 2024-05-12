```
collector.filesystem.ignored-mount-points
collector.filesystem.mount-points-exclude
```
```
```
su - mon -s /bin/bash
```
```
echo 'export DOCKER_USER="$(id -u):$(id -g)"' >> ~/.bash_profile
source ~/.bash_profile
docker-compose up
env UID=${UID} GID=${GID} docker compose up -d
```
```
docker compose down -v
```
```
--storage.tsdb.path=/prometheus/tsdb
--storage.tsdb.retention.time
```
```
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker volume prune $(docker volume ls)
```
```	  
- GF_SECURITY_ADMIN_USER=admin
- GF_SECURITY_ADMIN_PASSWORD=grafana
```

```
volumes:
  prom_data:
depends_on:
  - prometheus
```

```
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
docker system prune
docker system prune -af
```