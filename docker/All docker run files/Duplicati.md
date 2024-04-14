```
docker run -d \
  --name=Duplicati \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Paris \
  -e CLI_ARGS= `#optional` \
  -p 8200:8200 \
  -v /srv/Docker/Duplicati/config:/config \
  -v /srv/Docker/Duplicati/backups:/backups \
  -v /srv/Docker/Vaultwarden:/source/Vaultwarden \
  --restart unless-stopped \
  lscr.io/linuxserver/duplicati:latest
```
