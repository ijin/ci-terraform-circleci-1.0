#!/bin/bash
# set -ex

if [ $# -eq 0 ]; then
    echo "No arguments supplied"
    exit 1
fi

SHA1=`echo ${CIRCLE_SHA1} | cut -c1-7`

if [ $1 -eq 0 ]; then
    export SL_COLOR="good"
    export SL_TEXT="Planet has been *terraformed* for ${CIRCLE_BRANCH} (<${CIRCLE_COMPARE_URL}|${SHA1}>) by ${CIRCLE_USERNAME} !!"
    export SL_ICON="https://raw.githubusercontent.com/hashicorp/terraform/master/website/source/assets/images/logo-static.png"
    export EXIT=0
    echo "Terraform: success!"
else
    echo $1
    export SL_COLOR="danger"
    export SL_TEXT="*Failed* to terraform planet for ${CIRCLE_BRANCH} (<${CIRCLE_COMPARE_URL}|${SHA1}>) by ${CIRCLE_USERNAME} !!"
    export SL_ICON="http://futalog.com/pic/s/150620/1434796527674.jpg"
    export SL_IMG="https://gist.githubusercontent.com/ijin/265f8078bf9bdd119589/raw/cec59839ae91adc031407264aca3f2362a58d4ef/george.jpg"
    export EXIT=1
    echo "Terraform: failure.."
fi

curl -X POST --data-urlencode 'payload={"username": "Terraformer", "icon_url": "'"$SL_ICON"'", "attachments": [{ "color": "'"$SL_COLOR"'", "text": "'"$SL_TEXT"'", "mrkdwn_in": ["text"], "image_url": "'"$SL_IMG"'" }] }' https://hooks.slack.com/services/${SLACK_HOOK}
exit $EXIT
