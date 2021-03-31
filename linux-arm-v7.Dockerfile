FROM hotio/base@sha256:411bf1c3c08e452c2c8692ddde636b0099fbd3cead53846c096a5014fd57f908

EXPOSE 7337

ARG URL_ARM
RUN curl -fsSL "${URL_ARM}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
