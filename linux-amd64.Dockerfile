FROM hotio/base@sha256:4105128e6d8427bcd9c45d24141e1fad84d66ccc8716d380c6e89da17822963f

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 7337

ARG TRACKARR_URL=https://gitlab.com/cloudb0x/trackarr/uploads/abcb8141583abb86e16b30804a94d997/trackarr_v1.1.2_linux_amd64.tar.gz

# install trackarr
RUN curl -fsSL "${TRACKARR_URL}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
