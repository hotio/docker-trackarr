FROM golang:stretch as builder
ARG BINARY=trackarr

RUN mkdir -p /${BINARY}
WORKDIR /${BINARY}

ARG TRACKARR_VERSION

RUN git clone -n https://gitlab.com/cloudb0x/trackarr.git . && \
    git checkout ${TRACKARR_VERSION} -b hotio && \
    go get github.com/GeertJohan/go.rice/rice && \
    make vendor && \
    make build

FROM hotio/base@sha256:f1629f6864be54d0d4ed469bbc5fc20f8f7a92121fbc536368c9279e262065d1

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 7337

# install trackarr
COPY --from=builder /trackarr/dist/trackarr_linux_arm64/trackarr /${APP_DIR}/trackarr
RUN chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
