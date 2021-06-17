FROM golang:alpine as builder

RUN apk add --no-cache make git yarn

ARG VERSION

RUN git clone -n https://gitlab.com/cloudb0x/trackarr.git /trackarr && cd /trackarr && \
    git checkout ${VERSION} -B develop && \
    go get github.com/GeertJohan/go.rice/rice && \
    make vendor && \
    make TIMESTAMP=$(date -u --date=@$(git show -s --format=%ct ${VERSION}) +%s) build

FROM hotio/base@sha256:da6ba3ad8e073c1fe48ae4dee0fd274522458574d4ceec5033dbcd97a11a48aa

EXPOSE 7337

COPY --from=builder /trackarr/dist/trackarr_linux_arm/trackarr ${APP_DIR}/trackarr
RUN chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
