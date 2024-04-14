```
docker run -d \
  --name=TeamSpeak3-Server \
  -e TS3SERVER_LICENSE=accept \
  -p 9987:9987/udp \
  -p 10011:10011 \
  -p 30033:30033 \
  -v /srv/Docker/TeamSpeak3-Server:/var/ts3server \
  teamspeak:latest
```
