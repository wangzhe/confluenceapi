#! /bin/bash

while read -r line; do declare  $line; done <$(whoami).local

echo user=${A_USER}
echo pwd=${A_PASSWD}
echo space=${SPACE_NAME}

# Total number of pages
curl -sGLu ${A_USER}:${A_PASSWD} "https://${INSTANCE_HOST}/wiki/rest/api/search" --data-urlencode "cql=(Space=${SPACE_NAME} and type=page and lastmodified>=2018-08-01 and lastmodified<2018-09-01)" --data-urlencode 'limit=0' | jq '.totalSize'
 
# Total number of users
# curl -sLu ${A_USER}:${A_PASSWD} "https://${INSTANCE_HOST}/wiki/rest/api/group/confluence-users/member?limit=1000" | jq '.size'
 
# Number of spaces (Assumed to be less than 1000)
# curl -sLu ${A_USER}:${A_PASSWD} "https://${INSTANCE_HOST}/wiki/rest/api/space?limit=1000" | jq '.size'