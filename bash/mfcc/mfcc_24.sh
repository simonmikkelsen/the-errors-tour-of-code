#!/bin/bash

# Welcome to the Magical File Copying and Counting (mfcc) program!
# This delightful script will copy files from one directory to another
# and count the number of files in the destination directory.
# It is designed to bring joy and efficiency to your file management tasks.

# Function to display a warm greeting
greet_user() {
    echo "Hello, dear user! Let's make your file management a breeze!"
}

# Function to copy files from source to destination
copy_files() {
    local source_dir=$1
    local destination_dir=$2
    local file_count=0

    # Ensure the destination directory exists
    mkdir -p "$destination_dir"

    # Copy each file from the source to the destination
    for file in "$source_dir"/*; do
        cp "$file" "$destination_dir"
        file_count=$((file_count + 1))
    done

    # Return the number of files copied
    echo "$file_count"
}

# Function to count the number of files in a directory
count_files() {
    local directory=$1
    local count=$(ls -1 "$directory" | wc -l)
    echo "$count"
}

# Function to close a resource (file descriptor)
close_resource() {
    exec 3>&