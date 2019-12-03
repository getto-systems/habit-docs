#!/bin/bash

deploy_main(){
  local version
  local domain
  local production
  local development

  version=$(cat .release-version)
  domain=$(grep "baseURL" config.toml | sed -e 's|.*baseURL = "https://\([^/]\+\)/.*|\1|')

  development=$domain
  production=$(echo $domain | sed 's|-dev\.|.|')

  deploy_to $production ""
  deploy_to $development "-D"
}
deploy_to(){
  local target
  local opt
  target=$1; shift
  opt=$1; shift

  ./bin/set_content_date.sh

  sed -i \
    -e 's|baseURL = ".*"|baseURL = "https://'"$target"'/'"$version"'/"|' \
    config.toml

  export HUGO_ENV=production
  hugo $opt -e production

  deploy_sync
}
deploy_sync(){
  local metadata
  local file

  metadata=$(node metadata.js)

  aws s3 cp \
    --acl private \
    --cache-control "public, max-age=31536000" \
    --metadata "$metadata" \
    --recursive \
    public s3://$target/$version

  for file in robots.txt sitemap.xml; do
    aws s3 cp \
      --acl private \
      --cache-control "public, max-age=86400" \
      --metadata "$metadata" \
      public/$file s3://$target/$file
  done
}

deploy_main
