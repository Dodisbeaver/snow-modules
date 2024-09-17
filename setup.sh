#!/bin/bash

clone_or_pull_repo() {
    local repo_name=$1
    local repo_url=$2

    if [ ! -d "$repo_name" ]; then
        echo "Cloning $repo_name repository..."
        git clone "$repo_url"
    else
        echo "$repo_name repository already exists. Pulling latest changes..."
        cd "$repo_name"
        git pull
        cd ..
    fi
}

clone_or_pull_repo "TechLabs-Expressions-API" "https://github.com/dodisbeaver/TechLabs-Expressions-API.git"

clone_or_pull_repo "detection-api-server" "https://github.com/dodisbeaver/detection-api-server.git"

echo "Starting Docker containers..."
docker compose up --build

echo "Setup complete!"
