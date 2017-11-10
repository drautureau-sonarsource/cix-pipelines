#!/bin/bash

#TEST
#GIT_URL=https://github.com/drautureau-sonarsource/cix-pipelines.git
#GIT_BRANCH=add-notifications-to-burgr
#GIT_COMMIT=8362e73fcc450725a628dc3eec29b12065ff3c59
#BUILD_NUMBER=42
#STAGE_NAME=Build
#BUILD_URL=http://localhost:8080/job/cix-pipelines/job/add-notifications-to-burgr/42/

timestamp=$(date +%FT%T%:z)
git_repo_url=${GIT_URL%.git}
tmp=${git_repo_url#https://}
IFS='/'
read -r -a array <<< "$tmp"
unset IFS
git_owner="${array[1]}"
git_project="${array[2]}"
burgr_step_name=${1}
burgr_step_type=${2}
burgr_step_status=${3}

cp step-burgr.json step-burgr.tmp
sed -i "s|@@GIT_OWNER@@|${git_owner}|g" step-burgr.tmp
sed -i "s|@@GIT_PROJECT@@|${git_project}|g" step-burgr.tmp
sed -i "s|@@BUILD_NUMBER@@|${BUILD_NUMBER}|g" step-burgr.tmp
sed -i "s|@@BUILD_NUMBER@@|${BUILD_NUMBER}|g" step-burgr.tmp
sed -i "s|@@BURGR_STEP_NAME@@|${burgr_step_name}|g" step-burgr.tmp
sed -i "s|@@BURGR_STEP_TYPE@@|${burgr_step_type}|g" step-burgr.tmp
sed -i "s|@@GIT_BRANCH@@|${GIT_BRANCH}|g" step-burgr.tmp
sed -i "s|@@GIT_COMMIT@@|${GIT_COMMIT}|g" step-burgr.tmp
sed -i "s|@@BUILD_URL@@|${BUILD_URL}|g" step-burgr.tmp
sed -i "s|@@BURGR_STEP_STATUS@@|${burgr_step_status}|g" step-burgr.tmp
sed -i "s|@@TIMESTAMP@@|${timestamp}|g" step-burgr.tmp
sed -i "s|@@TIMESTAMP@@|${timestamp}|g" step-burgr.tmp
