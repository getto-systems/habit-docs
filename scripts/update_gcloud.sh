#!/bin/bash

version=$(
  bash -c "gcloud components list > /dev/null" 2>&1 | \
  grep "latest.*: [0-9.]\+" | \
  sed "s/.*: \([0-9.]\+\)/\1/" \
)

sed -i -e "s|GOOGLE_CLOUD_SDK_VERSION .*|GOOGLE_CLOUD_SDK_VERSION $version|" Dockerfile
