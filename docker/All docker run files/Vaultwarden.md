```
docker run -d \
  --name Vaultwarden \
  -p 100:80 \
  -v /srv/Docker/Vaultwarden:/data/ \
  vaultwarden/server:latest
```
