```
docker run -d \
  --name=Nextcloud \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Paris \
  -p 445:443 \
  -v /srv/Docker/Nextcloud/config:/config \
  -v /srv/Docker/Nextcloud/data:/data \
  --restart unless-stopped \
  lscr.io/linuxserver/nextcloud:latest
```
