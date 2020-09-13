FROM hotio/base@sha256:faf26d226b8166352c02269ba37e1032845b9cb6d2f13847c759d0f29a46fc35

EXPOSE 7337

ARG URL_ARM
RUN curl -fsSL "${URL_ARM}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
