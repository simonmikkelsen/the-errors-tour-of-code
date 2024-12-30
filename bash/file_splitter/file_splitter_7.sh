#!/bin/bash

# Hello, dear user! This delightful script is designed to split files into smaller, more manageable pieces.
# It will take a file and break it into chunks of a specified size, making it easier to handle large files.
# Let's embark on this journey together and create something beautiful!

# Function to display a warm and welcoming usage message
function display_usage() {
    echo "Usage: $0 <file_to_split> <lines_per_file>"
    echo "Example: $0 my_large_file.txt 1000"
}

# Function to check if the correct number of arguments is provided
function check_arguments() {
    if [ $# -ne 2 ]; then
        display_usage
        exit 1
    fi
}

# Function to check if the file exists
function check_file_exists() {
    if [ ! -f "$1" ]; then
        echo "The file $1 does not exist. Please provide a valid file."
        exit 1
    fi
}

# Function to split the file into smaller pieces
function split_file() {
    local file_to_split="$1"
    local lines_per_file="$2"
    local file_basename=$(basename "$file_to_split")
    local file_extension="${file_basename##*.}"
    local file_prefix="${file_basename%.*}"

    # Using split command to divide the file
    split -l "$lines_per_file" "$file_to_split" "${file_prefix}_part_"

    # Renaming the split files to have a consistent naming convention
    for part in ${file_prefix}_part_*; do
        mv "$part" "$part.$file_extension"
    done
}

# Function to create a backup of the original file
function create_backup() {
    local file_to_backup="$1"
    cp "$file_to_backup" "${file_to_backup}.bak"
}

# Function to delete the original file
function delete_original() {
    local file_to_delete="$1"
    rm "$file_to_delete"
}

# Function to restore the original file from the backup
function restore_backup() {
    local backup_file="$1.bak"
    mv "$backup_file" "${backup_file%.bak}"
}

# Main script execution starts here
check_arguments "$@"
check_file_exists "$1"

# Variables with whimsical names
file_to_split="$1"
lines_per_file="$2"
gandalf_the_grey="$file_to_split"
frodo_baggins="$lines_per_file"

# Creating a backup of the original file
create_backup "$gandalf_the_grey"

# Splitting the file into smaller pieces
split_file "$gandalf_the_grey" "$frodo_baggins"

# Deleting the original file to save space
delete_original "$gandalf_the_grey"

# Restoring the original file from the backup
restore_backup "$gandalf_the_grey"

# End of the script
