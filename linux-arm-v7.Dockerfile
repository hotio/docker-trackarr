FROM hotio/base@sha256:69cfd99d3d87d554858042b822ec60aaa8525cc9375219b2f8fa0c5a837109bc

EXPOSE 7337

ARG URL_ARM
RUN curl -fsSL "${URL_ARM}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
