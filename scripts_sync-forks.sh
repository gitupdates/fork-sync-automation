#!/bin/bash
# Script to sync multiple forked repositories.

# List of repositories (add your forked repository URLs here)
repos=(
    "git@github.com:yourusername/forked-repo1.git"
    "git@github.com:yourusername/forked-repo2.git"
)

for repo in "${repos[@]}"; do
    echo "Processing $repo..."
    # Extract repository name from URL
    repo_name=$(basename "$repo" .git)

    # Clone the repository if it doesn't exist locally
    if [ ! -d "$repo_name" ]; then
        git clone "$repo"
    fi

    # Navigate to the repository folder
    cd "$repo_name" || exit

    # Add upstream remote if not already added
    if ! git remote | grep -q "upstream"; then
        git remote add upstream "https://github.com/original-owner/${repo_name}.git"
    fi

    # Fetch and merge changes from upstream
    git fetch upstream
    git checkout main
    git merge upstream/main
    git push origin main

    # Return to the parent folder
    cd ..
done

echo "All repositories have been synced!"