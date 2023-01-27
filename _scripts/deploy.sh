#!/bin/bash

set -e

echo 'Installing bundles...'
cd ${SITE_LOCATION}
# gem install bundler
gem install bundler -v '~> 2.3.13'
bundle install
bundle list | grep "middleman ("

echo 'Building site...'
bundle exec middleman build

echo 'Publishing site...'
cd ${BUILD_LOCATION}

remote_repo="https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git" && \
remote_branch=${REMOTE_BRANCH}

git config user.name 'github-actions'
git config user.email 'github-actions@users.noreply.github.com'

echo "Push the changes"
git add .
git commit -am "Published at $(date)"
git push --force ${REMOTE_BRANCH} main:${REMOTE_BRANCH} > /dev/null 2>&1

echo "Publishing complete"