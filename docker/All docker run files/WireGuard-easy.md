### A REMPLIR
```WG_HOST=YOUR_SERVER_IP``` 

```PASSWORD=YOUR_ADMIN_PASSWORD```

```
docker run -d \
  --name=WireGuard-easy \
  -e WG_HOST=YOUR_SERVER_IP \
  -e PASSWORD=YOUR_ADMIN_PASSWORD \
  -v /srv/Docker/WireGuard-easy:/etc/wireguard \
  -p 51820:51820/udp \
  -p 51821:51821/tcp \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_MODULE \
  --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
  --sysctl="net.ipv4.ip_forward=1" \
  --restart unless-stopped \
  weejewel/wg-easy:latest
```
