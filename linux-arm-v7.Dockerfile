FROM hotio/base@sha256:70e8ded98060532e016833ffaf9d5f0ce8ca674ebc052bb8b12bdf66a90c61fe

EXPOSE 7337

ARG URL_ARM
RUN curl -fsSL "${URL_ARM}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
