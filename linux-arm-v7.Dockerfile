FROM hotio/base@sha256:ed5052300d2e5b6ce7e1cda9ae91707f5ad6562941023d440ce8f909368224fa

EXPOSE 7337

ARG URL_ARM
RUN curl -fsSL "${URL_ARM}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
