FROM golang:buster as builder

RUN apt update && apt install -y --no-install-recommends --no-install-suggests yarnpkg

ARG TRACKARR_VERSION

RUN git clone -n https://gitlab.com/cloudb0x/trackarr.git /trackarr && cd /trackarr && \
    git checkout ${TRACKARR_VERSION} && \
    go get github.com/GeertJohan/go.rice/rice && \
    make vendor && \
    make build

FROM hotio/base@sha256:e657aeb562b27964f7f214fe4f2cbccd768703636090972fd013be3709930043

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 7337

# install trackarr
COPY --from=builder /trackarr/dist/trackarr_linux_arm/trackarr /${APP_DIR}/trackarr
RUN chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
