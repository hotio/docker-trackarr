FROM hotio/base@sha256:d467e7bab4178ba8a2a635b510ccc76cf73fef193c3e86026c334071eaca2886

EXPOSE 7337

ARG URL_ARM
RUN curl -fsSL "${URL_ARM}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
