#!/bin/bash

./bin/update_gcloud.sh
./bin/update_hugo.sh

if [ "$(git status -s Dockerfile)" ]; then
  getto-hangar-build.sh

  git config user.email "$GIT_USER_EMAIL"
  git config user.name "$GIT_USER_NAME"

  git add Dockerfile
  git commit -m "update: tool version"

  curl https://raw.githubusercontent.com/getto-systems/version-dump/master/bin/version_dump.sh | bash
  curl https://raw.githubusercontent.com/getto-systems/version-dump/master/bin/push_tags.sh | bash
fi
