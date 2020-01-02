FROM hotio/base@sha256:cc6a5540d7a891e295c3af6e85d268d9f3b6660d3ba9614ee0fc7cab2c080947

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 7337

ARG TRACKARR_URL=https://gitlab.com/cloudb0x/trackarr/uploads/52c3816c3ea68932055d49be48029bd6/trackarr_1.0.0_linux_amd64.tar.gz

# install trackarr
RUN curl -fsSL "${TRACKARR_URL}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
