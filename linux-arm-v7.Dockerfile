FROM hotio/base@sha256:de669d75984e10be15a1e8c5dd432c3ce86bc70b897671614fe73827efa500d7

EXPOSE 7337

ARG URL_ARM
RUN curl -fsSL "${URL_ARM}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
