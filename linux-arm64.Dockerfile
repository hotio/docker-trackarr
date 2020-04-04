FROM hotio/base@sha256:f1629f6864be54d0d4ed469bbc5fc20f8f7a92121fbc536368c9279e262065d1

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 7337

ARG TRACKARR_URL=https://gitlab.com/cloudb0x/trackarr/uploads/3abecd22301967d3f3d3ed5b3dc65dea/trackarr_v1.6.2-dev_linux_arm64.tar.gz

# install trackarr
RUN curl -fsSL "${TRACKARR_URL}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
