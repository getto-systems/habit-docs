#!/bin/bash

deploy_main(){
  local version
  local domain
  local metadata
  local file

  version=$(cat .release-version)

  ./bin/set_content_date.sh

  sed -i \
    -e 's|baseURL = "https://\([^/]\+\)/dev/"|baseURL = "https://\1/'"$version"'/"|' \
    config.toml

  domain=$(grep "baseURL" config.toml | sed -e 's|.*baseURL = "https://\([^/]\+\)/.*|\1|')

  export HUGO_ENV=production
  hugo -EF -e production

  metadata=$(node metadata.js)

  aws s3 cp \
    --acl private \
    --cache-control "public, max-age=31536000" \
    --metadata "$metadata" \
    --recursive \
    public s3://$domain/$version

  for file in robots.txt sitemap.xml; do
    aws s3 cp \
      --acl private \
      --cache-control "public, max-age=86400" \
      --metadata "$metadata" \
      public/$file s3://$domain/$file
  done
}

deploy_main
