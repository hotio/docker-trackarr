FROM golang:alpine as builder

RUN apk add --no-cache make git yarn

ARG VERSION

RUN git clone -n https://gitlab.com/cloudb0x/trackarr.git /trackarr && cd /trackarr && \
    git checkout ${VERSION} -B develop && \
    go get github.com/GeertJohan/go.rice/rice && \
    make vendor && \
    make TIMESTAMP=$(date -u --date=@$(git show -s --format=%ct ${VERSION}) +%s) build

FROM hotio/base@sha256:da1df0b31b7ce8db14acc08a2a3cc60699e5270752c4aac9a5497f955606aea5

EXPOSE 7337

COPY --from=builder /trackarr/dist/trackarr_linux_arm/trackarr ${APP_DIR}/trackarr
RUN chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
