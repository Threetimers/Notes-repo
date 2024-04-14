# Ajouter SearXNG à Heimdall

Ajouter au fichier searchproviders.yaml (chemin du fichier /srv/Docker/Heimdall/www/searchproviders.yaml)

```yaml
searxng:
   id: searxng
   url: https://searxng.doubeibfr.com/search
   name: SearXNG
   method: get
   target: _blank
   query: q
```
