FROM hotio/base@sha256:bd2ab8d6ea224bdb356eac5aa25303d818cbf93260d0960cac9e6f60178081cc

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 7337

ARG TRACKARR_URL=https://gitlab.com/cloudb0x/trackarr/uploads/52c3816c3ea68932055d49be48029bd6/trackarr_1.0.0_linux_amd64.tar.gz

# install trackarr
RUN curl -fsSL "${TRACKARR_URL}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
