#!/bin/sh

set -u

action=$(cat $GITHUB_EVENT_PATH | jq -r .action)

if [[ $action != "created" ]] 
then
  exit 0
fi 

echo "Action: ${action}"
command=$(cat $GITHUB_EVENT_PATH | jq -r .comment.body)

if [[ ${command:0:1} != "." ]] 
then
  exit 0
fi

echo "Command: ${command}"

manifest=$(cat .comment-to-curl.json)
url=$(jq -n "$manifest" | jq -r .${command}.url)

if [ -z "$url" ]
then
  exit 0
fi

echo "URL: ${url}"

curl --silent "$url" > /dev/null 
