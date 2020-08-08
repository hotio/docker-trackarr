FROM hotio/base@sha256:4e4d9fc97ed14e8c66adef921f3b55186be80856d8d427fbda5fb447d700e226

EXPOSE 7337

ARG TRACKARR_URL
RUN curl -fsSL "${TRACKARR_URL}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
