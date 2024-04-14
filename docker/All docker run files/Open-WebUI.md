### If Ollama is on your computer, use this command:

```
docker run -d \
  --name Open-WebUI \
  -p 3000:8080 \
  --add-host=host.docker.internal:host-gateway \
  -v /srv/Docker/Open-WebUI:/app/backend/data \
  --restart unless-stopped \
  ghcr.io/open-webui/open-webui:main
```

### If Ollama is on a Different Server, use this command:

```
docker run -d \
  --name Open-WebUI \
  -e OLLAMA_BASE_URL=https://example.com \
  -v /srv/Docker/Open-WebUI:/app/backend/data \
  --restart unless-stopped \
  ghcr.io/open-webui/open-webui:main
```
