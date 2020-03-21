#!/bin/bash

set -e

######################################################################################################
# function
######################################################################################################

function check() {
  local name=${1}
  local name_upper=$(echo ${name} | tr 'a-z' 'A-Z')
  local latest=${2}
  echo "[check] ${name} ${latest}"
  local latest_check=$(echo $repo_tgas | grep -w ${latest} | wc -l )
  if [[ ${latest_check} == 0 ]]; then
    local commit="Upgrade ${name} version to ${latest}"
    echo "[check] ${commit}"
    sed -i "s#${name_upper}_VERSION .*#${name_upper}_VERSION $latest#g" ${name}/Dockerfile
    sed -i "s#${name} .* #${name} ${latest} #g" README.md
    git add -A
    git commit -m "${commit}"
    git tag -a "${name}-${latest}" -m "${commit}"
    echo "[check] ${name} done."
    update=1
  fi
}

######################################################################################################
# main 
######################################################################################################

[ -z "${INPUT_GITHUB_TOKEN}" ] && {
    echo 'Missing input "github_token: ${{ secrets.TOKEN }}".';
    exit 1;
};

# git config
git config --global user.name "dlangchina"
git config --global user.email "dlangchina@dlangchina.com"

# update
update=0

# get latest
dmd_latest=$(curl -s http://downloads.dlang.org/releases/LATEST)
ldc_latest=$(curl -s https://ldc-developers.github.io/LATEST)
gdc_latest=$(curl -s http://gdcproject.org/downloads/LATEST)

# get tags
repo_tgas=$(git ls-remote --tags | awk -F'tags/' '{print $2}')
echo -e "[tags]\n${repo_tgas}"

# check
check dmd ${dmd_latest}
check ldc ${ldc_latest}
#check gdc ${gdc_latest}

# push
if [ ${update} -eq 1 ]; then
  remote_repo="https://${GITHUB_ACTOR}:${INPUT_GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
  git push "${remote_repo}" master --tags
fi
