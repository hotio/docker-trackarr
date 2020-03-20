FROM hotio/base@sha256:5fa856ae4a428184ae3b8a2863efbb786cd1808b38ea6ce1b420848b0a8f61b0

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 7337

ARG TRACKARR_URL=https://gitlab.com/cloudb0x/trackarr/uploads/18637c821451e75d0917b96175ff97f8/trackarr_v1.5.3_linux_amd64.tar.gz

# install trackarr
RUN curl -fsSL "${TRACKARR_URL}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
