FROM alpine:3@sha256:294b683cb724975bec92580e1e685676bd4b50bda910ddb8c51d4cabeaec77e6
ENV NFS_DIR=/nfs-share NFS_DOMAIN=* NFS_OPTION=fsid=0,ro,sync,insecure,all_squash,anonuid=65534,anongid=65534,no_subtree_check,nohide
RUN set -xe && \
    apk add --no-cache nfs-utils &&\
    mkdir -p /var/lib/nfs/v4recovery
COPY nfsd.sh /bin/nfsd.sh
EXPOSE 2049/tcp
CMD ["/bin/nfsd.sh"]