```
docker run -d \
  --name=Ollama \
  -p 11434:11434 \
  -v /srv/Docker/Ollama:/root/.ollama \
  --restart=unless-stopped \
  ollama/ollama:latest
```
