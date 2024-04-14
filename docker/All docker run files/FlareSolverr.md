```
docker run -d \
  --name=FlareSolverr \
  -e LOG_LEVEL=info \
  -p 8191:8191 \
  --restart unless-stopped \
  ghcr.io/flaresolverr/flaresolverr:latest
```
