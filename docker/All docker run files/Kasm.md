```
docker run -d \
  --name=Kasm \
  --privileged \
  -e KASM_PORT=450 \
  -e DOCKER_HUB_USERNAME=USER `#optional` \
  -e DOCKER_HUB_PASSWORD=PASS `#optional` \
  -e DOCKER_MTU=1500 `#optional` \
  -p 3000:3000 \
  -p 450:450 \
  -v /srv/Docker/Kasm/opt:/opt \
  -v /srv/Docker/Kasm/profiles:/profiles `#optional` \
  -v /srv/Docker/Kasm/input:/dev/input `#optional` \
  -v /srv/Docker/Kasm/data:/run/udev/data `#optional` \
  --restart unless-stopped \
  lscr.io/linuxserver/kasm:latest
```
