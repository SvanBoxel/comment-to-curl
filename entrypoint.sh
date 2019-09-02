#!/bin/sh

set -u

cd $GITHUB_WORKSPACE

manifest=$(cat .comment-to-curl.json)
command=$(jq .body $GITHUB_EVENT_PATH)

echo command 

url=$(jq -n "$manifest" | jq -r .${command}.url)
echo $url

curl --silent "$url" > /dev/null 
