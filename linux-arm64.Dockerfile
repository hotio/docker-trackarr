FROM hotio/base@sha256:889e7d2f588ebd0e79a9ccdd8351e560c9a91262223a449a8ef83088f0c03ca3

EXPOSE 7337

ARG URL_ARM64
RUN curl -fsSL "${URL_ARM64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
