FROM hotio/base@sha256:f144d6e131ef4c855fe4abef6cff162552d2a3c0414e1688b334527d169d69b9

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 7337

ARG TRACKARR_URL=https://gitlab.com/cloudb0x/trackarr/uploads/cf50769fad87207b67cb724805c6c2a1/trackarr_v1.1.4-dev_linux_amd64.tar.gz

# install trackarr
RUN curl -fsSL "${TRACKARR_URL}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
