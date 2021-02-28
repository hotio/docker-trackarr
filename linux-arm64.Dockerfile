FROM hotio/base@sha256:96350ff96c12387896f33a49396f33d5a07f07d23e9d8243c71c70ba322d551f

EXPOSE 7337

ARG URL_ARM64
RUN curl -fsSL "${URL_ARM64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
