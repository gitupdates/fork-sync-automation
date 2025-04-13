#!/bin/bash

# Script to sync all forked repositories with their upstream sources

# Define repositories and their upstream sources
declare -A repositories
repositories["my-forked-repo"]="https://github.com/upstream-owner/upstream-repo.git"

# Iterate over repositories and sync with upstream
for repo in "${!repositories[@]}"; do
  echo "Syncing $repo with ${repositories[$repo]}..."
  cd "$repo" || { echo "Repository $repo not found, skipping."; continue; }
  git remote add upstream "${repositories[$repo]}" || echo "Upstream already added."
  git fetch upstream
  git checkout main
  git merge upstream/main
  git push origin main
  cd ..
done

echo "All repositories synced successfully!"