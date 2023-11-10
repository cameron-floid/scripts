#!/bin/bash

# Function to explore subfolders recursively
explore_folders() {
    local dir="$1"

    # Change to the specified directory
    cd "$dir" || return

    # Open all images in the current directory
    for file in *.jpg *.jpeg *.png *.gif *.bmp *.tif *.tiff; do
        if [ -f "$file" ]; then
            echo "Opening: $file" # Print the file being opened for debugging purposes
            if command -v xdg-open &> /dev/null; then
                xdg-open "$file"
            elif command -v start &> /dev/null; then
                start "$file"
            else
                echo "Error: Neither xdg-open nor start command found."
            fi
            if [ $? -ne 0 ]; then
                echo "Error opening $file"
            fi
        fi
    done

    # Explore subdirectories recursively
    for subdir in */; do
        explore_folders "$subdir"
    done

    # Move back to the parent directory
    cd ..
}

# Get the directory path from the user or use the current directory
read -p "Enter the directory path (default is current directory): " dir_path
dir_path=${dir_path:-$(pwd)}

echo "Dir-path: $dir_path" # Print the entered directory path for debugging purposes

# Check if the directory exists
if [ ! -d "$dir_path" ]; then
    ls -la "$dir_path" # Print detailed directory information for further investigation
    echo "Error: Directory not found."
    exit 1
fi

# Explore all subfolders and open images
explore_folders "$dir_path"

echo "Images opened in the default image viewer."
