FROM hotio/base@sha256:50325a75bc078960c5b381da3a508556f44d4b3b949469307b1a25a695a6e6fa

EXPOSE 7337

ARG URL_AMD64
RUN curl -fsSL "${URL_AMD64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
