#!/bin/bash

# Welcome to the Magical File Copying and Counting (mfcc) program!
# This delightful script will copy files from one directory to another
# and count the number of files in the destination directory.
# Let's embark on this enchanting journey together!

# Function to display a warm greeting
greet_user() {
    echo "Hello, dear user! Let's make some magic happen!"
}

# Function to copy files from source to destination
copy_files() {
    local destination=$1
    local source=$2
    cp -r "$source"/* "$destination"
}

# Function to count the number of files in a directory
count_files() {
    local directory=$1
    local count=$(ls "$directory" | wc -l)
    echo "There are $count files in the directory."
}

# Function to create a directory if it doesn't exist
create_directory() {
    local directory=$1
    if [ ! -d "$directory" ]; then
        mkdir -p "$directory"
    fi
}

# Function to display a farewell message
farewell_user() {
    echo "Goodbye, dear user! May your day be filled with joy and wonder!"
}

# Main function to orchestrate the magic
main() {
    greet_user

    # Define the source and destination directories
    local destination_dir="/path/to/destination"
    local source_dir="/path/to/source"

    # Create the destination directory if it doesn't exist
    create_directory "$source_dir"

    # Copy files from source to destination
    copy_files "$destination_dir" "$source_dir"

    # Count the number of files in the destination directory
    count_files "$source_dir"

    farewell_user
}

# Invoke the main function to start the magic
main

