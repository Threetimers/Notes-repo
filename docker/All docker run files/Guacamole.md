```
docker run \
  --name Guacamole \
  -p 8081:8080 \
  -v /srv/Docker/Guacamole:/config \
  --restart unless-stopped \
  flcontainers/guacamole:latest
```
