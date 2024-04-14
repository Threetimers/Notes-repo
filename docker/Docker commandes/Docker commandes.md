# Docker commandes basiques

| Commandes| Explications | 
|----------|-----------|
|`docker run "nom de l'image"`|Démarre le conteneur depuis une image|
|`docker pull "nom de l'image"`|Télécharge une image|
|`docker rmi "nom de l'image"`|Efface une image|
|`docker image list` ou `docker image ls`|Liste toutes les images installées|
|`docker container ls` ou `docker container list`|Liste les containers lancés|
|`docker container ls --all` ou `docker container list -all`|Liste tous les conteneurs|
|`docker start "nom du conteneur"`|Démarre le conteneur|
|`docker attach "nom du conteneur"`|Contrôler le conteneur avec notre ligne de commande|
|`docker stop "nom du conteneur"`|Arrête le conteneur|
|`docker restart "nom du conteneur"`|Redémarre le conteneur|
|`docker kill "nom du conteneur"`|Arrête le conteneur immédiatement|
|`docker rm "nom du conteneur"`|Efface le conteneur|

# Docker Networks

| Commandes| Explications | 
|----------|-----------|
|`docker network ls` ou `docker container list`|Liste les réseaux|
|`docker network create -d bridge TEST`|Créer un réseau bridge nommé TEST|
|`docker network connect`|Connecte un conteneur à un réseau|
|`docker network create`|Créer un réseau|
|`docker network disconnect`|Déconnecte un conteneur d'un réseau|
|`docker network inspect`|Afficher des informations détaillées sur un ou plusieurs réseaux|
|`docker network prune`|Supprimer tous les réseaux inutilisés|
|`docker network rm "nom du réseau"`|Supprimer un ou plusieurs réseaux|

# Docker Compose 

| Commandes| Explications | 
|----------|-----------|
|`docker compose up -d`|Lance les conteneurs en arrière-plan en se basant sur le fichier docker-compose.yaml|
|`docker compose down`|Arrête et supprime les conteneurs en se basant sur le fichier docker-compose.yaml|
|`docker compose -f test.yaml up -d`|Lance les conteneurs en se basant sur le fichier test.yaml|
|`docker compose -f test.yaml down`|Arrête et supprime les conteneurs du fichier test.yaml|
