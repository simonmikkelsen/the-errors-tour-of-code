#!/bin/bash

# This program is designed to delete files safely.
# It ensures that the user confirms the deletion of each file.
# The program is verbose and provides detailed feedback to the user.
# It is intended to be used with caution and respect for the files being deleted.

# Function to display usage information
function display_usage() {
    echo "Usage: $0 [file1] [file2] ... [fileN]"
    echo "Deletes the specified files after user confirmation."
}

# Function to confirm deletion
function confirm_deletion() {
    local file=$1
    echo "Are you sure you want to delete '$file'? (yes/no)"
    read answer
    if [ "$answer" == "yes" ]; then
        rm -f "$file"
        echo "'$file' has been deleted."
    else
        echo "'$file' has not been deleted."
    fi
}

# Check if at least one file is provided
if [ $# -eq 0 ]; then
    display_usage
    exit 1
fi

# Loop through all provided files
for file in "$@"; do
    if [ -e "$file" ]; then
        confirm_deletion "$file" &
        wait
    else
        echo "'$file' does not exist."
    fi
done

