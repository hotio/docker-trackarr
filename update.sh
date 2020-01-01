#!/bin/bash

if [[ ${1} == "checkdigests" ]]; then
    mkdir ~/.docker && echo '{"experimental": "enabled"}' > ~/.docker/config.json
    image="hotio/base"
    tag="latest"
    manifest=$(docker manifest inspect ${image}:${tag})
    [[ -z ${manifest} ]] && exit 1
    digest=$(echo "${manifest}" | jq -r '.manifests[] | select (.platform.architecture == "amd64" and .platform.os == "linux").digest') && sed -i "s#FROM .*\$#FROM ${image}@${digest}#g" ./linux-amd64.Dockerfile && echo "${digest}"
    digest=$(echo "${manifest}" | jq -r '.manifests[] | select (.platform.architecture == "arm" and .platform.os == "linux").digest')   && sed -i "s#FROM .*\$#FROM ${image}@${digest}#g" ./linux-arm.Dockerfile   && echo "${digest}"
    digest=$(echo "${manifest}" | jq -r '.manifests[] | select (.platform.architecture == "arm64" and .platform.os == "linux").digest') && sed -i "s#FROM .*\$#FROM ${image}@${digest}#g" ./linux-arm64.Dockerfile && echo "${digest}"
else
    data=$(curl -fsSL https://gitlab.com/api/v4/projects/cloudb0x%2Ftrackarr/releases | jq -r '.[] | select (.name | endswith("-dev") | not)' | jq -s '.[0]')
    version=$(echo "${data}" | jq -r '.name' | sed s/^v//g)
    [[ -z ${version} ]] && exit 1
    url_amd64=$(echo "${data}" | jq -r '.assets.links[] | select (.name | contains("linux_amd64")).url')
    # url_arm=$(echo "${data}" | jq -r '.assets.links[] | select (.name | contains("linux_arm")).url')
    # url_arm64=$(echo "${data}" | jq -r '.assets.links[] | select (.name | contains("linux_arm64")).url')
    sed -i "s#ARG TRACKARR_URL=.*\$#ARG TRACKARR_URL=${url_amd64}#g" linux-amd64.Dockerfile
    # sed -i "s#ARG TRACKARR_URL=.*\$#ARG TRACKARR_URL=${url_arm}#g" linux-arm.Dockerfile
    # sed -i "s#ARG TRACKARR_URL=.*\$#ARG TRACKARR_URL=${url_arm64}#g" linux-arm64.Dockerfile
    sed -i "s/{TAG_VERSION=.*}$/{TAG_VERSION=${version}}/g" .drone.yml
    echo "##[set-output name=version;]${version}"
fi
