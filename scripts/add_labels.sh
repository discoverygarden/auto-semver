#!/bin/bash

set -e

# GITHUB Personal Access Token
TOKEN=${1}
# Repository owner
OWNER=${2}
# Repository name
REPO=${3}

curl -f -X POST https://api.github.com/repos/$OWNER/$REPO/labels -H "Authorization: token $TOKEN" -d '{"name":"major","description":"Backwards incompatible API changes.","color":"CC4E4E"}'
curl -f -X POST https://api.github.com/repos/$OWNER/$REPO/labels -H "Authorization: token $TOKEN" -d '{"name":"minor","description":"Added functionality that is backwards compatible.","color":"FFB24A"}'
curl -f -X POST https://api.github.com/repos/$OWNER/$REPO/labels -H "Authorization: token $TOKEN" -d '{"name":"patch","description":"Backwards compatible bug fixes.","color":"2766C6"}'
curl -f -X POST https://api.github.com/repos/$OWNER/$REPO/labels -H "Authorization: token $TOKEN" -d '{"name":"no-update","description":"No tag/release needs to be created.","color":"BFDADC"}'
