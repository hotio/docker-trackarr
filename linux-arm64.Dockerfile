FROM hotio/base@sha256:dfa66c21a6b019329679000bd0353b7547f7702c1c38fdeb03c75740bc8c10f4

EXPOSE 7337

ARG URL_ARM64
RUN curl -fsSL "${URL_ARM64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
