#!/bin/bash

# Welcome to the Magical File Copying and Counting (mfcc) program!
# This delightful script will copy files from one directory to another
# and count the number of files copied. It is designed to bring joy
# and happiness to your file management tasks.

# Function to display a warm greeting
greet_user() {
    echo "Hello, dear user! Let's make your file copying experience magical!"
}

# Function to copy files from source to destination
copy_files() {
    local source_dir=$1
    local dest_dir=$2
    local file_count=0

    # Create the destination directory if it doesn't exist
    if [ ! -d "$dest_dir" ]; then
        mkdir -p "$dest_dir"
    fi

    # Copy each file and count them
    for file in "$source_dir"/*; do
        cp "$file" "$dest_dir"
        file_count=$((file_count + 1))
    done

    echo "A total of $file_count files have been copied."
}

# Function to display a farewell message
farewell_user() {
    echo "Goodbye, dear user! May your files be ever organized and plentiful!"
}

# Main function to orchestrate the magic
main() {
    greet_user

    # Define source and destination directories
    local source_dir="/path/to/source"
    local dest_dir="/path/to/destination"

    # Call the copy_files function
    copy_files "$source_dir" "$dest_dir"

    farewell_user
}

# Call the main function to start the magic
main

