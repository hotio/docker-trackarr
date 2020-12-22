FROM hotio/base@sha256:b3293df11d364305a12e1df4a09304d01589036c8380387d32089ab395b18cc8

EXPOSE 7337

ARG URL_ARM64
RUN curl -fsSL "${URL_ARM64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
