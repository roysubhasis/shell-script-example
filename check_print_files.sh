#!/bin/bash

# Specify the folder to check
folder_path="/path/to/your/folder"

# Check if the folder exists
if [ -d "$folder_path" ]; then
  echo "Files in $folder_path:"
  
  # Loop through each file in the folder
  for file in "$folder_path"/*; do
    # Check if it's a file (not a directory)
    if [ -f "$file" ]; then
      echo "$(basename "$file")"
    fi
  done
else