FROM golang:buster as builder

ARG DEBIAN_FRONTEND="noninteractive"
RUN apt update && apt install -y --no-install-recommends --no-install-suggests yarnpkg

ARG TRACKARR_VERSION

RUN mkdir -p /trackarr && \
    git clone -n https://gitlab.com/cloudb0x/trackarr.git /trackarr && \
    cd /trackarr && \
    git checkout ${TRACKARR_VERSION} -b hotio && \
    go get github.com/GeertJohan/go.rice/rice && \
    GOOS=linux GOARCH=arm64 make vendor && \
    GOOS=linux GOARCH=arm64 make build

FROM hotio/base@sha256:f1629f6864be54d0d4ed469bbc5fc20f8f7a92121fbc536368c9279e262065d1

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 7337

# install trackarr
COPY --from=builder /trackarr/dist/trackarr_linux_arm64/trackarr /${APP_DIR}/trackarr
RUN chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
