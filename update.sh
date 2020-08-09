#!/bin/bash

if [[ ${1} == "checkdigests" ]]; then
    mkdir ~/.docker && echo '{"experimental": "enabled"}' > ~/.docker/config.json
    image="hotio/base"
    tag="alpine"
    manifest=$(docker manifest inspect ${image}:${tag})
    [[ -z ${manifest} ]] && exit 1
    digest=$(echo "${manifest}" | jq -r '.manifests[] | select (.platform.architecture == "amd64" and .platform.os == "linux").digest') && sed -i "s#FROM ${image}@.*\$#FROM ${image}@${digest}#g" ./linux-amd64.Dockerfile  && echo "${digest}"
    digest=$(echo "${manifest}" | jq -r '.manifests[] | select (.platform.architecture == "arm" and .platform.os == "linux").digest')   && sed -i "s#FROM ${image}@.*\$#FROM ${image}@${digest}#g" ./linux-arm-v7.Dockerfile && echo "${digest}"
    digest=$(echo "${manifest}" | jq -r '.manifests[] | select (.platform.architecture == "arm64" and .platform.os == "linux").digest') && sed -i "s#FROM ${image}@.*\$#FROM ${image}@${digest}#g" ./linux-arm64.Dockerfile  && echo "${digest}"
else
    data=$(curl -fsSL https://gitlab.com/api/v4/projects/cloudb0x%2Ftrackarr/releases | jq -r '.[] | select (.name | endswith("-dev") | not)' | jq -s '.[0]')
    version=$(echo "${data}" | jq -r '.name' | sed s/^v//g)
    [[ -z ${version} ]] && exit 1
    [[ ${version} == null ]] && exit 0
    url_amd64=$(echo "${data}" | jq -r '.assets.links[] | select (.name | contains("linux_amd64.tar.gz")).url')
    url_arm=$(echo "${data}" | jq -r '.assets.links[] | select (.name | contains("linux_arm.tar.gz")).url')
    url_arm64=$(echo "${data}" | jq -r '.assets.links[] | select (.name | contains("linux_arm64.tar.gz")).url')
    sed -i "s/{TRACKARR_VERSION=[^}]*}/{TRACKARR_VERSION=${version}}/g" .github/workflows/build.yml
    sed -i "s#{TRACKARR_URL_AMD64=[^}]*}#{TRACKARR_URL_AMD64=${url_amd64}}#g" .github/workflows/build.yml
    sed -i "s#{TRACKARR_URL_ARM=[^}]*}#{TRACKARR_URL_ARM=${url_arm}}#g" .github/workflows/build.yml
    sed -i "s#{TRACKARR_URL_ARM64=[^}]*}#{TRACKARR_URL_ARM64=${url_arm64}}#g" .github/workflows/build.yml
    echo "##[set-output name=version;]${version}"
fi
