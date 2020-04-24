FROM golang:buster as builder

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt update && apt install -y --no-install-recommends --no-install-suggests yarn nodejs

ARG TRACKARR_VERSION

RUN git clone -n https://gitlab.com/cloudb0x/trackarr.git /trackarr && cd /trackarr && \
    git checkout ${TRACKARR_VERSION} -B develop && \
    go get github.com/GeertJohan/go.rice/rice && \
    make vendor && \
    make TIMESTAMP=$(date -u --date=@$(git show -s --format=%ct ${TRACKARR_VERSION}) +%s) build

FROM hotio/base@sha256:4135836fc39a944a6586dac95601889e7e69af506908945fb49884c6462fddb8

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 7337

# install trackarr
COPY --from=builder /trackarr/dist/trackarr_linux_arm64/trackarr ${APP_DIR}/trackarr
RUN chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
