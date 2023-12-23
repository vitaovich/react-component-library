#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 GITHUB_USERNAME AUTH_TOKEN"
    exit 1
fi

# Assign the arguments to variables
GITHUB_USERNAME=$1
AUTH_TOKEN=$2

# Create or overwrite the .npmrc file in the user's home directory
echo "registry=https://registry.npmjs.org/" > ~/.npmrc
echo "@$GITHUB_USERNAME:registry=https://npm.pkg.github.com/" >> ~/.npmrc
echo "//npm.pkg.github.com/:_authToken=$AUTH_TOKEN" >> ~/.npmrc

echo ".npmrc file created/updated successfully."
