FROM alpine:3@sha256:c5b1261d6d3e43071626931fc004f70149baeba2c8ec672bd4f27761f8e1ad6b
ENV NFS_DIR=/nfs-share NFS_DOMAIN=* NFS_OPTION=fsid=0,ro,sync,insecure,all_squash,anonuid=65534,anongid=65534,no_subtree_check,nohide
RUN set -xe && \
    apk add --no-cache nfs-utils &&\
    mkdir -p /var/lib/nfs/v4recovery
COPY nfsd.sh /bin/nfsd.sh
EXPOSE 2049/tcp
CMD ["/bin/nfsd.sh"]