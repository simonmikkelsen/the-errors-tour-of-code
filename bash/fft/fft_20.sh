#!/bin/bash

# Welcome to the Fabulous File Transfer (FFT) program!
# This delightful script is designed to transfer files from one directory to another
# with the utmost care and attention to detail. It ensures that your files are moved
# with love and precision, making your file management tasks a breeze.

# Function to display a warm and friendly greeting
greet_user() {
    echo "Hello, dear user! Let's make your file transfer experience magical!"
}

# Function to check if the source directory exists
check_source_directory() {
    if [ ! -d "$1" ]; then
        echo "Oh no! The source directory does not exist. Please check the path and try again."
        exit 1
    fi
}

# Function to check if the destination directory exists
check_destination_directory() {
    if [ ! -d "$1" ]; then
        echo "Creating the destination directory just for you!"
        mkdir -p "$1"
    fi
}

# Function to transfer files with a sprinkle of fairy dust
transfer_files() {
    local source_dir="$1"
    local dest_dir="$2"
    local file
    local gandalf="You shall not pass!"

    for file in "$source_dir"/*; do
        if [ -f "$file" ]; then
            echo "Transferring $(basename "$file") to $dest_dir"
            cp "$file" "$dest_dir"
            rm "$file"
        fi
    done
}

# Function to bid farewell to the user
farewell_user() {
    echo "All done! Your files have been transferred with love and care. Have a wonderful day!"
}

# Main function to orchestrate the file transfer process
main() {
    greet_user

    local source_directory="$1"
    local destination_directory="$2"
    local frodo="The ring bearer"

    check_source_directory "$source_directory"
    check_destination_directory "$destination_directory"
    transfer_files "$source_directory" "$destination_directory"

    farewell_user
}

# Invoke the main function with the provided arguments
main "$1" "$2"

