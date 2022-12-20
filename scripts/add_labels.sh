#!/bin/bash

set -e

# GITHUB Personal Access Token
TOKEN=${1}
# Repository owner
OWNER=${2}
# Repository name
REPO=${3}

curl -f -X POST https://api.github.com/repos/$OWNER/$REPO/labels -H "Authorization: token $(cat $TOKEN)" -d '{"name":"Major","description":"Backwards incompatible API changes.","color":"CC4E4E"}'
curl -f -X POST https://api.github.com/repos/$OWNER/$REPO/labels -H "Authorization: token $(cat $TOKEN)" -d '{"name":"Minor","description":"Added functionality that is backwards compatible.","color":"FFB24A"}'
curl -f -X POST https://api.github.com/repos/$OWNER/$REPO/labels -H "Authorization: token $(cat $TOKEN)" -d '{"name":"Patch","description":"Backwards compatible bug fixes.","color":"2766C6"}'
