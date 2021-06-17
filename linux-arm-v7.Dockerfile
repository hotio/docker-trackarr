FROM hotio/base@sha256:da6ba3ad8e073c1fe48ae4dee0fd274522458574d4ceec5033dbcd97a11a48aa

EXPOSE 7337

ARG URL_ARM
RUN curl -fsSL "${URL_ARM}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
