FROM makocchi/alpine-git-curl-jq:latest

LABEL "com.github.actions.name"="Convert any GitHub comment into a CURL command"
LABEL "com.github.actions.description"="TODO"
LABEL "com.github.actions.icon"="anchor"
LABEL "com.github.actions.color"="yellow"

LABEL "repository"="https://github.com/SvanBoxel/comment-to-curl"
LABEL "homepage"="https://github.com/SvanBoxel/comment-to-curl/"
LABEL "maintainer"="Sebass van Boxel <hello@svboxel.com>"


COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
