FROM golang:alpine as builder

RUN apk add --no-cache make git yarn

ARG TRACKARR_VERSION

RUN git clone -n https://gitlab.com/cloudb0x/trackarr.git /trackarr && cd /trackarr && \
    git checkout ${TRACKARR_VERSION} -B develop && \
    go get github.com/GeertJohan/go.rice/rice && \
    make vendor && \
    make TIMESTAMP=$(date -u --date=@$(git show -s --format=%ct ${TRACKARR_VERSION}) +%s) build

FROM hotio/base@sha256:cac4e16e96664e8f25578b009d4c7471be2e04937e943a16a560adea042e843b

EXPOSE 7337

COPY --from=builder /trackarr/dist/trackarr_linux_arm/trackarr ${APP_DIR}/trackarr
RUN chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
