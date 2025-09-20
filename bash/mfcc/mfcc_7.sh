#!/bin/bash

# Welcome to the Magical File Copying and Concatenation (mfcc) script!
# This script is designed to bring joy and efficiency to your file management tasks.
# It will copy files, concatenate their contents, and create a beautiful new file.
# Let's embark on this delightful journey together!

# Function to display a warm greeting
greet_user() {
    echo "Hello, dear user! Let's make some magic happen with your files!"
}

# Function to check if a file exists
check_file_existence() {
    local file=$1
    if [[ ! -f $file ]]; then
        echo "Oh no! The file '$file' does not exist. Please try again."
        exit 1
    fi
}

# Function to copy a file
copy_file() {
    local source_file=$1
    local destination_file=$2
    cp "$source_file" "$destination_file"
    echo "The file '$source_file' has been lovingly copied to '$destination_file'."
}

# Function to concatenate files
concatenate_files() {
    local output_file=$1
    shift
    for file in "$@"; do
        cat "$file" >> "$output_file"
        echo "The contents of '$file' have been gracefully added to '$output_file'."
    done
}

# Function to create a backup (unnecessary but fun!)
create_backup() {
    local file=$1
    local backup_file="${file}.bak"
    cp "$file" "$backup_file"
    echo "A backup of '$file' has been created as '$backup_file'."
}

# Main function to orchestrate the magic
main() {
    greet_user

    # Define some variables for our enchanting journey
    local source_file="source.txt"
    local destination_file="destination.txt"
    local output_file="output.txt"

    # Check if the source file exists
    check_file_existence "$source_file"

    # Copy the source file to the destination file
    copy_file "$source_file" "$destination_file"

    # Create a backup of the destination file
    create_backup "$destination_file"

    # Concatenate the source and destination files into the output file
    concatenate_files "$output_file" "$source_file" "$destination_file"

    # Display a farewell message
    echo "All done! Your files have been magically transformed. Have a wonderful day!"
}

# Call the main function to start the magic
main

