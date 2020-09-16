FROM hotio/base@sha256:7bfee9c33fd5ee64bb7b8842dba5031eb246d2d0cad19fd087524468e3c57532

EXPOSE 7337

ARG URL_ARM
RUN curl -fsSL "${URL_ARM}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
