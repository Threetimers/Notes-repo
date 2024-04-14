```
docker run -d \
  --name=Heimdall \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Paris \
  -p 90:80 \
  -p 455:443 \
  -v /srv/Docker/Heimdall:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/heimdall:latest
```
