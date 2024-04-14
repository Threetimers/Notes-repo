```
docker run -d \
  --name=SWAG \
  --net=SWAG \
  --cap-add=NET_ADMIN \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Paris \
  -e URL=doubeibfr.duckdns.org \
  -e VALIDATION=duckdns \
  -e SUBDOMAINS=wildcard `#optional` \
  -e DUCKDNSTOKEN= `A REMPLIR`\
  -e CERTPROVIDER= `#optional` \
  -e DNSPLUGIN=cloudflare `#optional` \
  -e PROPAGATION= `#optional` \
  -e EMAIL= `#optional` \
  -e ONLY_SUBDOMAINS=false `#optional` \
  -e EXTRA_DOMAINS= `#optional` \
  -e STAGING=false `#optional` \
  -p 443:443 \
  -v /srv/Docker/SWAG:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/swag:latest
```
