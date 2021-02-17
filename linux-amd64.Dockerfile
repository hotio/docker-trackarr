FROM hotio/base@sha256:f61c51dd5ce6b96beb40e0fcd12f422260a724b69c60153e925969830cbe3ba0

EXPOSE 7337

ARG URL_AMD64
RUN curl -fsSL "${URL_AMD64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
