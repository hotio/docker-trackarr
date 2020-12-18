FROM hotio/base@sha256:76ee24b5c0268e712fbbfdb095b9be39de1cfce115085888cd3b7fa422f70c28

EXPOSE 7337

ARG URL_ARM64
RUN curl -fsSL "${URL_ARM64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
