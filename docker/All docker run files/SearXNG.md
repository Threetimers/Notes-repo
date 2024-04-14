```
docker run -d \
  --name SearXNG \
  --net=bridge \
  -e BASE_URL=http://localhost:8080 \
  -e INSTANCE_NAME=SearXNG \
  -p 8080:8080 \
  -v /srv/Docker/SearXNG:/etc/searxng \
  --restart=unless-stopped \
  searxng/searxng:latest
```
