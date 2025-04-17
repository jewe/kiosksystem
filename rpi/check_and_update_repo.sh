#!/bin/bash

# Define the repository directory
REPO_DIR="/home/user/ilmtal_counter"

# Navigate to the repository directory
cd "$REPO_DIR" || { echo "Repository directory not found"; exit 1; }

# Fetch the latest changes from the remote repository
git fetch origin

# Check if the local repository is up-to-date with the remote
LOCAL_HASH=$(git rev-parse @)
REMOTE_HASH=$(git rev-parse @{u})
BASE_HASH=$(git merge-base @ @{u})

if [ "$LOCAL_HASH" = "$REMOTE_HASH" ]; then
    echo "Repository is up-to-date"
elif [ "$LOCAL_HASH" = "$BASE_HASH" ]; then
    echo "Pulling changes from remote repository"
    
    git pull origin
    echo "Building fresh version"
    npm run build > ../update_repo_build.log

    echo "restart chrome & node"
    killall node
    killall chromium-browser
    
    cd /home/user/
    sh launch_chrome.sh &
    sh launch_node.sh &
elif [ "$REMOTE_HASH" = "$BASE_HASH" ]; then
    echo "Local repository has changes that are not pushed"
else
    echo "Local and remote repositories have diverged"
    exit 1
fi
