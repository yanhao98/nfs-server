# nfs-server

## Client:
```bash
sudo mount -v -t nfs -o vers=4,port=2049 nfs-server-ip:/ ~/nfs-files
```

```yaml
docker volume create --driver local \
  --opt type=nfs \
  --opt o=addr=nfs-server-ip,port=2049,nfsvers=4 \
  --opt device=:/ \
  nfs-volume

# docker-compose.yml
volumes:
  nfs-volume:
    external: true
```

## References:
- https://hub.docker.com/r/gists/nfs-server'