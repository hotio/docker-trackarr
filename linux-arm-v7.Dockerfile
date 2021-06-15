FROM hotio/base@sha256:3a001a4e2193756a0a43ffbc5f9922fde95560099c5e49f53b9b5a77558ad2bd

EXPOSE 7337

ARG URL_ARM
RUN curl -fsSL "${URL_ARM}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
