FROM hotio/base@sha256:fd6cef3f4f361b5def1337cfb26b796bc401cf8c07cae4ebd376f4d603a32136

EXPOSE 7337

ARG TRACKARR_URL
RUN curl -fsSL "${TRACKARR_URL}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
