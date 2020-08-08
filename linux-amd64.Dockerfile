FROM golang:alpine as builder

RUN apk add --no-cache make git yarn

ARG TRACKARR_VERSION

RUN git clone -n https://gitlab.com/cloudb0x/trackarr.git /trackarr && cd /trackarr && \
    git checkout ${TRACKARR_VERSION} -B develop && \
    go get github.com/GeertJohan/go.rice/rice && \
    make vendor && \
    make TIMESTAMP=$(date -u --date=@$(git show -s --format=%ct ${TRACKARR_VERSION}) +%s) build

FROM hotio/base@sha256:04bac33ed8094edb3100b0f4482d4c605a1bbbac7128ba994269b6b889842fdb

EXPOSE 7337

COPY --from=builder /trackarr/dist/trackarr_linux_amd64/trackarr ${APP_DIR}/trackarr
RUN chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
