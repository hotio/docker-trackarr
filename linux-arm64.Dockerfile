FROM hotio/base@sha256:20fdc5b0e7a27d1fa0ba18891dcca79c2d2f25d7a45bde88fff625c63942b2e3

EXPOSE 7337

ARG URL_ARM64
RUN curl -fsSL "${URL_ARM64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
