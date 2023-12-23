#!/bin/bash

# Path to the original script (ensure this is correct)
INITIALIZE_NPMRC_SCRIPT="/workspaces/react-component-library/bash/initialize_npmrc.sh"

# Check if the original script exists and is executable
if [ ! -f "$INITIALIZE_NPMRC_SCRIPT" ] || [ ! -x "$INITIALIZE_NPMRC_SCRIPT" ]; then
    echo "Error: The script $INITIALIZE_NPMRC_SCRIPT does not exist or is not executable."
    exit 1
fi

# Assign the arguments to variables or fetch from git config
GITHUB_USERNAME=${1:-$(git config --global user.name)}
AUTH_TOKEN=$2

# Check if the auth token is provided
if [ -z "$AUTH_TOKEN" ]; then
    echo "Usage: $0 [GITHUB_USERNAME] AUTH_TOKEN"
    echo "GITHUB_USERNAME is optional if it's set in git config."
    exit 1
fi

# Call the original script with the parameters
$INITIALIZE_NPMRC_SCRIPT "$GITHUB_USERNAME" "$AUTH_TOKEN"

echo "Finished initializing library."
