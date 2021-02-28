FROM hotio/base@sha256:ea5ee7980a86462fd41854214858fd9cb26a0917be8d8eaf8890e9aa295e866b

EXPOSE 7337

ARG URL_AMD64
RUN curl -fsSL "${URL_AMD64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
