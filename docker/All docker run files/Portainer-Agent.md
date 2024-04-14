```
docker run -d \
  --name Portainer-Agent \
  -p 9001:9001 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/lib/docker/volumes:/var/lib/docker/volumes \
  --restart=always \
  portainer/agent:latest
```
