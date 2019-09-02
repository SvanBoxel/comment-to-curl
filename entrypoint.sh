#!/bin/sh

set -u

cd $GITHUB_WORKSPACE

manifest=$(cat .comment-to-curl.json)
command='ping'

url=$(jq -n "$manifest" | jq -r .${command}.url)
echo url

curl --silent "https://github.com"
