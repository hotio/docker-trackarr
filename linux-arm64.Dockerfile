FROM hotio/base@sha256:83ea9215c846f38a684a44bb3410bb3edd73e777b912f5936280cdbd7c5103b0

EXPOSE 7337

ARG TRACKARR_URL
RUN curl -fsSL "${TRACKARR_URL}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
