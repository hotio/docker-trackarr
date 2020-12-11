FROM hotio/base@sha256:8de5bac19eca5cf21f5878dd49fe41505e6e37e7606e2b9d7111c802a7ceae8c

EXPOSE 7337

ARG URL_ARM
RUN curl -fsSL "${URL_ARM}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
