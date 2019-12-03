#!/bin/bash

./bin/update_gcloud.sh
./bin/update_hugo.sh

if [ "$(git status -s Dockerfile)" ]; then
  getto-hangar-build.sh

  git add Dockerfile
  git commit -m "update: tool version"

  curl https://trellis.getto.systems/ci/bump-version/1.2.2/request.sh | bash -s -- ./.update-version-message.sh
fi
