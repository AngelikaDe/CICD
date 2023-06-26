#!/bin/bash

TOKEN="#############"
CHAT_ID="#########"

if [[ $CI_JOB_STATUS == 'success' && $CI_JOB_NAME == 'deploy' ]]; then
    message="Deployment successful!"
elif [[ $CI_JOB_STATUS == 'success' && $CI_JOB_NAME == 'style-check_grep' ]]; then
    message="Tests successful!"
else
    message="Deployment/Test failed!"
fi

curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" -d "chat_id=$CHAT_ID" -d "text=$message" > /dev/null
