```
docker run -d \
  --name Watchtower \
  -e TZ=Europe/Paris \
  -e WATCHTOWER_CLEANUP=true \
  -e WATCHTOWER_SCHEDULE='0 0 0 * * *' \
  -v /var/run/docker.sock:/var/run/docker.sock \
  containrrr/watchtower:latest
```
