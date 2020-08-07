FROM hotio/base@sha256:6388363381be9eb6f9b4215ee0ffedcac3a573f0daed54193219fc0c2ffb873d

EXPOSE 7337

ARG TRACKARR_URL
RUN curl -fsSL "${TRACKARR_URL}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
