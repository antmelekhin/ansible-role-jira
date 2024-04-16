#!/bin/bash

set -ex

# Git commiter
GIT_USER="${GITHUB_ACTOR}"
GIT_MAIL="${GITHUB_ACTOR}@users.noreply.github.com"

# Script output colors
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NO_COLOR='\e[0m'

# Get current version
CURRENT_VERSION="$(awk '/^.*_version:/{print $2}' 'defaults/main.yml' | tr -d \')"

# Get latest version
URL='https://my.atlassian.com/download/feeds/current/jira-software.json'
APP_JSON="$(curl --silent $URL | sed -e 's/downloads//' -e 's/[()]//g' | jq '[ .[] | select((.edition == "Enterprise") and (.platform == "Mac OS X, Unix")) ]' | jq 'max_by(.version)')"
LATEST_VERSION="$(echo $APP_JSON | jq -r '.version')"

# Validate latest version
if ! [[ $LATEST_VERSION =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] ; then
   echo "error: ${LATEST_VERSION} is not a valid Semantic Version" >&2; exit 0
fi

# Compare current and latest versions
if [[ $CURRENT_VERSION == $LATEST_VERSION ]]; then
    echo -e "${GREEN}Newest version is used.${NO_COLOR}"
    exit 0
fi

# Update latest version
sed -i "s/_version:.*$/_version: '${LATEST_VERSION}'/" 'defaults/main.yml'
sed -i "s/${CURRENT_VERSION}/${LATEST_VERSION}/" 'README.md'

# Repository variables
REPO_NAME=$(git config --get remote.origin.url | sed -e 's|^https://github.com/||')
UPDATE_VERSION_BRANCH="update-to-${LATEST_VERSION}"
UPDATE_VERSION_COMMIT="fix(version): jira updated to \`${LATEST_VERSION}\` release"

# Create an update branch
REMOTE_BRANCH="$(curl --silent https://api.github.com/repos/${REPO_NAME}/branches/${UPDATE_VERSION_BRANCH} | jq -r .name)"

if [ "${REMOTE_BRANCH}" == null ] ; then
    git config user.name "${GIT_USER}"
    git config user.email "${GIT_MAIL}"
    git checkout -b "${UPDATE_VERSION_BRANCH}"

    # Push new version
    git add defaults/main.yml README.md
    git commit --signoff -m "${UPDATE_VERSION_COMMIT}"
    
    echo -e "${GREEN}Pushing to ${UPDATE_VERSION_BRANCH} branch.${NO_COLOR}"
    if ! git push "https://${GITHUB_TOKEN}:@github.com/${REPO_NAME}" --set-upstream "${UPDATE_VERSION_BRANCH}"; then
        echo -e "${RED}Branch push failed.${NO_COLOR}"
        exit 1
    fi
else
    echo -e "${YELLOW}Branch is already on remote.${NO_COLOR}"
fi

# Create Pull Request
RELEASE_NOTES="$(echo $APP_JSON | jq -r '.releaseNotes')"
PR_MESSAGE="Atlassian released a new LTS version of [Jira](${RELEASE_NOTES}) - **${LATEST_VERSION}**!\n\nThis automated PR updates code to bring new version into repository."
PR_JSON="$(printf '{"title":"%s","body":"%s","head":"%s","base":"%s"}' "${UPDATE_VERSION_COMMIT}" "${PR_MESSAGE}" "${UPDATE_VERSION_BRANCH}" "main")"

curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${GITHUB_TOKEN}"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/repos/${REPO_NAME}/pulls" \
  -d "${PR_JSON}"
