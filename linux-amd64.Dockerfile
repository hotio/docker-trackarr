FROM golang:alpine as builder

RUN apk add --no-cache make git yarn

ARG VERSION

RUN git clone -n https://gitlab.com/cloudb0x/trackarr.git /trackarr && cd /trackarr && \
    git checkout ${VERSION} -B develop && \
    go get github.com/GeertJohan/go.rice/rice && \
    make vendor && \
    make TIMESTAMP=$(date -u --date=@$(git show -s --format=%ct ${VERSION}) +%s) build

FROM hotio/base@sha256:e4b68d01d4bd68602b1a4c40684a60133628145bf68d6ab08c9e3681c88ca9ac

EXPOSE 7337

COPY --from=builder /trackarr/dist/trackarr_linux_amd64/trackarr ${APP_DIR}/trackarr
RUN chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
