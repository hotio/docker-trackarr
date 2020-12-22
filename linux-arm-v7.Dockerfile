FROM hotio/base@sha256:24b945b0e4787dcbb80ebb667536ab233cf3c418cb61434d644c5a7d78606d0f

EXPOSE 7337

ARG URL_ARM
RUN curl -fsSL "${URL_ARM}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
