#!/bin/bash

# Prompt the user for the directory path
echo "Enter the directory path:"
read user_dir

# Check if the directory exists
if [ ! -d "$user_dir" ]; then
    echo "Error: Directory does not exist."
    exit 1
fi

# Navigate to the specified directory
cd "$user_dir"

# List all image files and save the names to a text file
ls *.png *.jpg *.jpeg *.gif *.bmp > image_list.txt

echo "Image names have been saved to image_list.txt in $user_dir"
