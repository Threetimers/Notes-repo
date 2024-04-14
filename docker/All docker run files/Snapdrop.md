```
docker run -d \
  --name Snapdrop \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Paris \
  -p 85:80 \
  -p 445:443 \
  -v /srv/Docker/Snapdrop:/config \
  --restart=unless-stopped \
  lscr.io/linuxserver/snapdrop:latest
```
