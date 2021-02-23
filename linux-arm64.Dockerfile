FROM hotio/base@sha256:750f2361b1691ac35a427eff3a288a373efb6ce26a78f03a3dff95099edfad42

EXPOSE 7337

ARG URL_ARM64
RUN curl -fsSL "${URL_ARM64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
