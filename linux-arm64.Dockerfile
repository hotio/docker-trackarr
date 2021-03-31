FROM hotio/base@sha256:5f68a5ce9c8a2ebbcb8bab7c5d2953f1e6ac41784fad32b57652f36acd9a0ee2

EXPOSE 7337

ARG URL_ARM64
RUN curl -fsSL "${URL_ARM64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
