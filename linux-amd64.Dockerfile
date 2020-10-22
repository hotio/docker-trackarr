FROM hotio/base@sha256:8dab11de6a8e64fbbdef2b1ef1b6c64ff8ada8401589d0b4d384ad20300fb24e

EXPOSE 7337

ARG URL_AMD64
RUN curl -fsSL "${URL_AMD64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
