#!/usr/bin/env bash

# Read project name from user
PROJECT_NAME=""
read -p "Enter project name: " PROJECT_NAME

# Replace project name
find . -type f -name '*' \
  -not -path './node_modules/*' \
  -not -path './.git/*' \
  -not -path './assets/*' | \
  xargs sed -i '' -e "s/create-ponczek-game/$PROJECT_NAME/g"

# Remove "bin" from package.json
sed -i '' -e '2,4d' ./package.json

# Remove this script
rm -rf ./init.sh
