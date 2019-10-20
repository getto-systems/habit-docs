#!/bin/bash

set_content_date(){
  local file
  local attr
  local date

  for file in $(git grep GETTO_DOCS_CONTENT_DATE | sed 's/:.*//'); do
    if [ "$(git grep -e "^---\$" -n $file | wc -l)" -gt 1 ]; then
      attr=$(git grep -e "^---\$" -n $file | head -2 | tail -1 | cut -d':' -f2)
      date=$(git log -1 --format=%ad --date=short $file)
      sed -i -e "1,$attr s|GETTO_DOCS_CONTENT_DATE|$date|" $file
    fi
  done
}

set_content_date
