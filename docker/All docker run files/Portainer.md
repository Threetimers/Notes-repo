```
docker run -d \
  --name Portainer \
  -p 9443:9443 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /srv/Docker/Portainer:/data \
  --restart=always \
  portainer/portainer-ce:latest
```
