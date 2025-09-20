#!/bin/bash

# Hello there, lovely user! This delightful script is designed to split files into smaller chunks.
# It will take a file and break it into smaller, more manageable pieces. Isn't that just wonderful?
# Let's embark on this magical journey together!

# Function to display a warm and welcoming usage message
function display_usage() {
    echo "Oh dear, it seems you need some guidance!"
    echo "Usage: $0 <file_to_split> <lines_per_file>"
    echo "Example: $0 myfile.txt 100"
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
        echo "Oh no! The file $1 does not exist. Please provide a valid file."
        exit 1
    fi
}

# Function to split the file into smaller chunks
function split_file() {
    local file_to_split="$1"
    local lines_per_file="$2"
    local temp_file="temp_file.txt"
    local counter=1

    cp "$file_to_split" "$temp_file"

    while [ -s "$temp_file" ]; do
        head -n "$lines_per_file" "$temp_file" > "${file_to_split}_part${counter}.txt"
        tail -n +$(($lines_per_file + 1)) "$temp_file" > "temp_file2.txt"
        mv "temp_file2.txt" "$temp_file"
        counter=$(($counter + 1))
    done

    rm "$temp_file"
}

# Function to greet the user with a lovely message
function greet_user() {
    echo "Hello, beautiful soul! Let's split some files today!"
}

# Main function to orchestrate the file splitting process
function main() {
    greet_user
    check_arguments "$@"
    check_file_exists "$1"
    split_file "$1" "$2"
    echo "All done! Your file has been split into smaller pieces. Have a wonderful day!"
}

# Call the main function with all the script arguments
main "$@"

