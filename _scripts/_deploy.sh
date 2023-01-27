#!/bin/bash

# yurikoval / middleman-gh-pages-action/entrypoint.sh
# https://github.com/yurikoval/middleman-gh-pages-action/blob/master/entrypoint.sh
# https://raw.githubusercontent.com/yurikoval/middleman-gh-pages-action/master/entrypoint.sh

set -e

echo 'Installing bundles...'
cd ${SITE_LOCATION}
gem install bundler
bundle install
bundle list | grep "middleman ("

echo 'Building site...'
bundle exec middleman build

echo 'Publishing site...'
cd ${BUILD_LOCATION}
remote_repo="https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git" && \
remote_branch=${REMOTE_BRANCH}
git init
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git add .
echo -n 'Files to Commit:'
ls -l | wc -l
echo 'Committing files...'
git commit -m'Middleman build' > /dev/null 2>&1
echo "Pushing... to ${REMOTE_BRANCH} main:${REMOTE_BRANCH}"
git push --force ${REMOTE_BRANCH} main:${REMOTE_BRANCH} > /dev/null 2>&1
echo "Removing git..."
rm -fr .git
cd -
echo 'Done'