#!/bin/bash

# List of valid browsers
valid_browsers=("chrome" "firefox" "edge" "safari" "opera")

# Check if the argument is specified
if [ -z "$1" ]; then
  echo "No browser argument specified. Please provide one of the following: chrome, firefox, edge, safari, opera."
  exit 1
fi

browser=$1

# Check if the argument is valid
if [[ ! " ${valid_browsers[@]} " =~ " ${browser} " ]]; then
  echo "Invalid browser argument specified. Please provide one of the following: chrome, firefox, edge, safari, opera."
  exit 1
fi

# Step 1: Create a "dist" directory
mkdir -p dist

# Step 2: Copy everything from the "src" directory to the newly created "dist" one
cp -r src/* dist/

# Step 3: Copy the {argument}.json file from the "manifests" directory to the "dist" directory
cp manifests/$browser.json dist/manifest.json

# Step 4: Zip the "dist" directory in the "build" directory as {argument}.zip containing the "dist" directory and all the files inside
zip -r build/$browser.zip dist/

# Step 5: Remove the "dist" directory
rm -rf dist/
