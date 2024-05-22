#!/bin/bash

# Variables
TEMPLATE_DIR="$HOME/Documents/pattern_m"
NEW_PROJECT_NAME="my_new_project"
NEW_PROJECT_DIR="$HOME/Desktop/$NEW_PROJECT_NAME"

# Check if template directory exists
if [ ! -d "$TEMPLATE_DIR" ]; then
  echo "Template directory $TEMPLATE_DIR does not exist."
  exit 1
fi

# Create a new Flutter project
flutter create $NEW_PROJECT_NAME

# Move the newly created project to the Desktop directory
mv $NEW_PROJECT_NAME "$NEW_PROJECT_DIR"

# Navigate to the newly created project directory
cd "$NEW_PROJECT_DIR"

# Copy template files to the new project directory
cp -r $TEMPLATE_DIR/* .

# Ensure the new project has correct permissions
chmod -R 755 .

# Clean up: Remove the default lib folder and replace with template lib folder if exists
if [ -d "$NEW_PROJECT_DIR/lib" ]; then
  rm -rf "$NEW_PROJECT_DIR/lib"
  cp -r "$TEMPLATE_DIR/lib" "$NEW_PROJECT_DIR/lib"
fi

# Run flutter pub get to fetch dependencies
flutter pub get

echo "New Flutter project $NEW_PROJECT_NAME created from template $TEMPLATE_DIR and located in $NEW_PROJECT_DIR."


# chmod +x test.sh
# this command is used to make the file executable

# ./test.sh
# this command is used to run the file