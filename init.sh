#!/usr/bin/env bash

# Read project name from user
PROJECT_NAME=""
read -p "Enter project name: " PROJECT_NAME

PROJECT_PATH="$(pwd)/$PROJECT_NAME"

# Copy template files
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR/.."
cp -r "./create-ponczek-game" "$PROJECT_PATH"
cd "$PROJECT_PATH"

# Replace project name
find . -type f -name '*' \
  -not -path './node_modules/*' \
  -not -path './.git/*' \
  -not -path './ponczek/*' \
  -not -path './assets/*' | \
  xargs sed -i '' -e "s/create-ponczek-game/$PROJECT_NAME/g"

# Remove "bin" from package.json
sed -i '' -e '2,4d' ./package.json

# Remove this script
rm -rf ./init.sh

# Clean git state
rm -rf ./.git
git init
git submodule add https://github.com/deseteral/ponczek.git
git submodule update --init --recursive

# Install deps
cd ./ponczek
yarn install
cd ..
yarn install
