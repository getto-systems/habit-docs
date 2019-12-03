#!/bin/bash

version=$(
  curl --silent "https://api.github.com/repos/gohugoio/hugo/releases/latest" | \
  grep '"tag_name":' | \
  sed -E 's/.*"v([^"]+)".*/\1/' \
)

sed -i -e "s|HUGO_VERSION .*|HUGO_VERSION $version|" Dockerfile
