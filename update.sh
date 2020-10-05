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
elif [[ ${1} == "tests" ]]; then
    echo "List installed packages..."
    docker run --rm --entrypoint="" "${2}" apk -vv info | sort
    echo "Check if app works..."
    app_url="http://localhost:7337"
    docker run --rm --network host -d --name service -e DEBUG="yes" "${2}"
    currenttime=$(date +%s); maxtime=$((currenttime+60)); while (! curl -fsSL "${app_url}" > /dev/null) && [[ "$currenttime" -lt "$maxtime" ]]; do sleep 1; currenttime=$(date +%s); done
    curl -fsSL "${app_url}" > /dev/null
    status=$?
    echo "Show docker logs..."
    docker logs service
    exit ${status}
elif [[ ${1} == "screenshot" ]]; then
    app_url="http://localhost:7337"
    docker run --rm --network host -d --name service -e DEBUG="yes" "${2}"
    currenttime=$(date +%s); maxtime=$((currenttime+60)); while (! curl -fsSL "${app_url}" > /dev/null) && [[ "$currenttime" -lt "$maxtime" ]]; do sleep 1; currenttime=$(date +%s); done
    docker run --rm --network host --entrypoint="" -u "$(id -u "$USER")" -v "${GITHUB_WORKSPACE}":/usr/src/app/src zenika/alpine-chrome:with-puppeteer node src/puppeteer.js
    exit 0
else
    data=$(curl -fsSL https://gitlab.com/api/v4/projects/cloudb0x%2Ftrackarr/releases | jq -r '.[] | select (.name | endswith("-dev") | not)' | jq -s '.[0]')
    version=$(echo "${data}" | jq -r '.name' | sed s/^v//g)
    [[ -z ${version} ]] && exit 1
    [[ ${version} == null ]] && exit 0
    url_amd64=$(echo "${data}" | jq -r '.assets.links[] | select (.name | contains("linux_amd64.tar.gz")).url')
    url_arm=$(echo "${data}" | jq -r '.assets.links[] | select (.name | contains("linux_arm.tar.gz")).url')
    url_arm64=$(echo "${data}" | jq -r '.assets.links[] | select (.name | contains("linux_arm64.tar.gz")).url')
    echo '{"version":"'"${version}"'","url_amd64":"'"${url_amd64}"'","url_arm":"'"${url_arm}"'","url_arm64":"'"${url_arm64}"'"}' | jq . > VERSION.json
    echo "##[set-output name=version;]${version}"
fi
