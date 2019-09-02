#!/bin/sh

set -u

cd $GITHUB_WORKSPACE

command=$(cat $GITHUB_EVENT_PATH | jq .comment.body)
if [[ ${command:0:1} == "." ]] 
then
  exit 1
fi

echo $command 

manifest=$(cat .comment-to-curl.json)

url=$(jq -n "$manifest" | jq -r .${command}.url)
echo $url

curl --silent "$url" > /dev/null 
