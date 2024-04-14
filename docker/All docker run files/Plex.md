```
docker run -d \
  --name Plex \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Paris \
  -e VERSION=docker
  -e PLEX_CLAIM= `#optional https://www.plex.tv/claim/` \
  -p 32400:32400 \
  -v /srv/Docker/Plex/config:/config \
  -v /srv/Docker/Plex/SERIES:/tv \
  -v /srv/Docker/Plex/FILMS:/movies \
  --restart=unless-stopped \
  lscr.io/linuxserver/plex:latest
```
