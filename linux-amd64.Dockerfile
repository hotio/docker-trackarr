FROM hotio/base@sha256:10d402516ed261fda82090ae0342f969cc2502da6b3ba40ec350bfcba6d7e21f

EXPOSE 7337

ARG URL_AMD64
RUN curl -fsSL "${URL_AMD64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
