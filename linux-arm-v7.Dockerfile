FROM hotio/base@sha256:826a92fd93a1244c67fb8a8ae16840c924ee4e45a28b5491ea3f0e3953c5b582

EXPOSE 7337

ARG URL_ARM
RUN curl -fsSL "${URL_ARM}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
