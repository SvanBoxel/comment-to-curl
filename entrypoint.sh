#!/bin/sh

set -u

cd $GITHUB_WORKSPACE

action=$(cat $GITHUB_EVENT_PATH | jq .action)

echo $action
if [[ $action != "created" ]] 
then
  exit 1
fi 

echo "Action: ${action}"
command=$(cat $GITHUB_EVENT_PATH | jq .comment.body)

if [[ ${command:0:1} == "." ]] 
then
  exit 1
fi


echo "Command: ${command}"

manifest=$(cat .comment-to-curl.json)
url=$(jq -n "$manifest" | jq -r .${command}.url)

if [ -z "$url" ]
then
  exit 1
fi

echo "URL: ${url}"

curl --silent "$url" > /dev/null 
