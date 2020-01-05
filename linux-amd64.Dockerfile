FROM hotio/base@sha256:19528531a53b74b22fb547651356f7f07fe56c831ead2880dbfd6eec045a27bf

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 7337

ARG TRACKARR_URL=https://gitlab.com/cloudb0x/trackarr/uploads/e518ffdd879d3e4c7b8b270dd7fcdc4f/trackarr_v1.1.1_linux_amd64.tar.gz

# install trackarr
RUN curl -fsSL "${TRACKARR_URL}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
