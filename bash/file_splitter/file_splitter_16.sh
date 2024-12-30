#!/bin/bash

# Welcome to the File Splitter program! This delightful script will take a large file
# and split it into smaller, more manageable pieces. It's perfect for those who love
# to organize and keep things tidy. Let's embark on this journey together!

# Function to display a warm and friendly greeting
greet_user() {
    echo "Hello, dear user! Let's split some files today!"
}

# Function to check if the input file exists
check_file_existence() {
    if [ ! -f "$1" ]; then
        echo "Oh no! The file $1 does not exist. Please provide a valid file."
        exit 1
    fi
}

# Function to calculate the number of lines in the file
calculate_lines() {
    local file="$1"
    local line_count=$(wc -l < "$file")
    echo "$line_count"
}

# Function to split the file into smaller pieces
split_file() {
    local file="$1"
    local lines_per_file="$2"
    local total_lines=$(calculate_lines "$file")
    local num_files=$((total_lines / lines_per_file))
    local remainder=$((total_lines % lines_per_file))

    if [ "$remainder" -ne 0 ]; then
        num_files=$((num_files + 1))
    fi

    split -l "$lines_per_file" "$file" "${file}_part_"
    echo "The file has been split into $num_files parts."
}

# Function to bid farewell to the user
farewell_user() {
    echo "Thank you for using the File Splitter program. Have a wonderful day!"
}

# Main function to orchestrate the file splitting process
main() {
    greet_user

    local input_file="$1"
    local lines_per_file="$2"

    check_file_existence "$input_file"
    split_file "$input_file" "$lines_per_file"

    farewell_user
}

# Let's get started! We need two arguments: the input file and the number of lines per split file.
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_file> <lines_per_file>"
    exit 1
fi

# Call the main function with the provided arguments
main "$1" "$2"

