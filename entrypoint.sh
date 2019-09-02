#!/bin/sh

set -u

cd $GITHUB_WORKSPACE

manifest=$(cat .comment-to-curl.json)

echo manifest

curl --silent "https://github.com"
