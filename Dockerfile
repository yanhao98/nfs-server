FROM alpine:3@sha256:b89d9c93e9ed3597455c90a0b88a8bbb5cb7188438f70953fede212a0c4394e0
ENV NFS_DIR=/nfs-share NFS_DOMAIN=* NFS_OPTION=fsid=0,ro,sync,insecure,all_squash,anonuid=65534,anongid=65534,no_subtree_check,nohide
RUN set -xe && \
    apk add --no-cache nfs-utils &&\
    mkdir -p /var/lib/nfs/v4recovery
COPY nfsd.sh /bin/nfsd.sh
EXPOSE 2049/tcp
CMD ["/bin/nfsd.sh"]