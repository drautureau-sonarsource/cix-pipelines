#!/bin/bash

#TEST
#GIT_URL=https://github.com/drautureau-sonarsource/cix-pipelines.git
#GIT_BRANCH=add-notifications-to-burgr
#GIT_COMMIT=8362e73fcc450725a628dc3eec29b12065ff3c59

timestamp=$(date +%FT%T%:z)
git_repo_url=${GIT_URL%.git}
tmp=${git_repo_url#https://}
IFS='/'
read -r -a array <<< "$tmp"
unset IFS
git_owner="${array[1]}"
git_project="${array[2]}"

cp commit-burgr.json commit-burgr.tmp
sed -i "s|@@GIT_BRANCH@@|${GIT_BRANCH}|g" commit-burgr.tmp
sed -i "s|@@GIT_REPO_URL@@|${git_repo_url}|g" commit-burgr.tmp
sed -i "s|@@GIT_REPO_URL@@|${git_repo_url}|g" commit-burgr.tmp
sed -i "s|@@GIT_REPO_URL@@|${git_repo_url}|g" commit-burgr.tmp
sed -i "s|@@GIT_COMMIT@@|${GIT_COMMIT}|g" commit-burgr.tmp
sed -i "s|@@GIT_COMMIT@@|${GIT_COMMIT}|g" commit-burgr.tmp
sed -i "s|@@GIT_COMMIT@@|${GIT_COMMIT}|g" commit-burgr.tmp
sed -i "s|@@GIT_COMMIT@@|${GIT_COMMIT}|g" commit-burgr.tmp
sed -i "s|@@TIMESTAMP@@|${timestamp}|g" commit-burgr.tmp
sed -i "s|@@GIT_OWNER@@|${git_owner}|g" commit-burgr.tmp
sed -i "s|@@GIT_OWNER@@|${git_owner}|g" commit-burgr.tmp
sed -i "s|@@GIT_PROJECT@@|${git_project}|g" commit-burgr.tmp
