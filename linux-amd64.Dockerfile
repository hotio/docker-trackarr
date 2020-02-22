FROM hotio/base@sha256:039214e09dba0974ad79ac56e166b943503c09179a4743865928392addcb1f2a

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 7337

ARG TRACKARR_URL=https://gitlab.com/cloudb0x/trackarr/uploads/ea6e9c5c494f2b15819fe0f7c71ba73a/trackarr_v1.4.1-dev_linux_amd64.tar.gz

# install trackarr
RUN curl -fsSL "${TRACKARR_URL}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
