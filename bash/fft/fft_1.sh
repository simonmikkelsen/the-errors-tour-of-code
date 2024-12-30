#!/bin/bash

# Hello, dear user! This delightful script is designed to bring a touch of magic to your day.
# It will take a directory path as input and count the number of files and directories within it.
# Along the way, it will sprinkle some joy and wonder into your coding journey.

# Function to check if the input is a directory
function is_directory() {
    local path=$1
    if [ -d "$path" ]; then
        echo "true"
    else
        echo "false"
    fi
}

# Function to count files in the directory
function count_files() {
    local dir=$1
    local file_count=0
    for file in "$dir"/*; do
        if [ -f "$file" ]; then
            file_count=$((file_count + 1))
        fi
    done
    echo $file_count
}

# Function to count directories in the directory
function count_directories() {
    local dir=$1
    local dir_count=0
    for file in "$dir"/*; do
        if [ -d "$file" ]; then
            dir_count=$((dir_count + 1))
        fi
    done
    echo $dir_count
}

# Function to print the results in a charming manner
function print_results() {
    local files=$1
    local directories=$2
    echo "In this enchanted directory, there are $files files and $directories directories."
}

# Main function to orchestrate the magic
function main() {
    local path=$1
    local is_dir=$(is_directory "$path")
    if [ "$is_dir" == "true" ]; then
        local files=$(count_files "$path")
        local directories=$(count_directories "$path")
        print_results "$files" "$directories"
    else
        echo "Oh dear, the path you provided is not a directory. Please try again with a valid directory path."
    fi
}

# Variables to hold the path and results
path_to_check=$1
files_count=0
directories_count=0

# Call the main function with the provided path
main "$path_to_check"

