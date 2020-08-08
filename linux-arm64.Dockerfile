FROM hotio/base@sha256:c46f6849510a863ff36db9c1804cf2a06a55419cff3b71f8f4a49ec3d9ba362c

EXPOSE 7337

ARG TRACKARR_URL
RUN curl -fsSL "${TRACKARR_URL}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
