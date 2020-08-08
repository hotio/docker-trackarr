FROM golang:alpine as builder

RUN apk add --no-cache make git yarn

ARG TRACKARR_VERSION

RUN git clone -n https://gitlab.com/cloudb0x/trackarr.git /trackarr && cd /trackarr && \
    git checkout ${TRACKARR_VERSION} -B develop && \
    go get github.com/GeertJohan/go.rice/rice && \
    make vendor && \
    make TIMESTAMP=$(date -u --date=@$(git show -s --format=%ct ${TRACKARR_VERSION}) +%s) build

FROM hotio/base@sha256:c0d26bf85d89f03b93cdb5d0882e4f1573ca1a30d9f6d059c1ad06ccb568c6a9

EXPOSE 7337

COPY --from=builder /trackarr/dist/trackarr_linux_arm64/trackarr ${APP_DIR}/trackarr
RUN chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
