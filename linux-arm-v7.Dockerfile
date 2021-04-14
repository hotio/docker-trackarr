FROM hotio/base@sha256:292b23ea39878cae6c827a3b6a47d483972cbf8903d3a05d12c18cf0fe539ebb

EXPOSE 7337

ARG URL_ARM
RUN curl -fsSL "${URL_ARM}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
