FROM hotio/base@sha256:fa5915d58b8598cdda80125eb96cd39a253fc6729410d6bd1ac01e94c3489824

EXPOSE 7337

ARG URL_ARM
RUN curl -fsSL "${URL_ARM}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
