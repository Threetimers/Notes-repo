```
docker run -d \
  --name=Nginx-Proxy-Manager \
  -p 80:80 \
  -p 81:81 \
  -p 443:443 \
  -v /srv/Docker/Nginx-Proxy-Manager/data:/data
  -v /srv/Docker/Nginx-Proxy-Manager/letsencrypt:/etc/letsencrypt
  --restart unless-stopped \
  jc21/nginx-proxy-manager:latest
```
