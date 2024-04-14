```
docker run -d \
  --name changedetection \
  --net=bridge \ 
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Paris \
  -e BASE_URL= #optional \
  -p 5000:5000 \
  -v /srv/Docker/changedetection:/config \
  --restart=unless-stopped \
  lscr.io/linuxserver/changedetection.io:latest
```
