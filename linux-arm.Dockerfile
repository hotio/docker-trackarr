FROM hotio/base@sha256:e657aeb562b27964f7f214fe4f2cbccd768703636090972fd013be3709930043

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 7337

ARG TRACKARR_URL=https://gitlab.com/cloudb0x/trackarr/uploads/3abecd22301967d3f3d3ed5b3dc65dea/trackarr_v1.6.2-dev_linux_arm.tar.gz

# install trackarr
RUN curl -fsSL "${TRACKARR_URL}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
