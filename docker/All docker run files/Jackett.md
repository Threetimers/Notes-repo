```
docker run -d \
  --name=Jackett \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Paris \
  -e AUTO_UPDATE=true `#optional` \
  -e RUN_OPTS= `#optional` \
  -p 9117:9117 \
  -v /srv/Docker/Jackett/config:/config \
  -v /srv/Docker/Jackett/downloads:/downloads \
  --restart unless-stopped \
  lscr.io/linuxserver/jackett:latest
```
