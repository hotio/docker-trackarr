FROM hotio/base@sha256:f41e2825ab530cf4f226a39ea9bdb8dee1e13e06031fcdfc41a860cf97d0c532

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 7337

ARG TRACKARR_URL=https://gitlab.com/cloudb0x/trackarr/uploads/42cf36d7ad6641313fe872024f1e0edb/trackarr_v1.1.4_linux_amd64.tar.gz

# install trackarr
RUN curl -fsSL "${TRACKARR_URL}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
