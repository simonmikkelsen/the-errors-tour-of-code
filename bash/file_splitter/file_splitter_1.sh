#!/bin/bash

# Welcome to the File Splitter program, a delightful tool designed to help you
# gracefully divide a file into smaller, more manageable pieces. This program
# will take a file and split it into multiple parts, each with a specified
# number of lines. It's perfect for those moments when you need to break down
# a large file into smaller chunks for easier handling and processing.

# Function to display a warm and friendly greeting
greet_user() {
    echo "Hello, dear user! Welcome to the File Splitter program."
}

# Function to check if the correct number of arguments is provided
check_arguments() {
    if [ "$#" -ne 2 ]; then
        echo "Oh no! You need to provide exactly two arguments: the file to split and the number of lines per part."
        exit 1
    fi
}

# Function to validate that the file exists
validate_file() {
    if [ ! -f "$1" ]; then
        echo "Oops! The file '$1' does not exist. Please provide a valid file."
        exit 1
    fi
}

# Function to validate that the number of lines is a positive integer
validate_lines() {
    if ! [[ "$2" =~ ^[0-9]+$ ]]; then
        echo "Oh dear! The number of lines must be a positive integer."
        exit 1
    fi
}

# Function to split the file into smaller parts
split_file() {
    local file="$1"
    local lines="$2"
    local part=1
    local temp_file="temp_file.txt"
    local line_count=0

    while IFS= read -r line; do
        echo "$line" >> "$temp_file"
        line_count=$((line_count + 1))
        if [ "$line_count" -eq "$lines" ]; then
            mv "$temp_file" "${file}_part${part}.txt"
            part=$((part + 1))
            line_count=0
            temp_file="temp_file.txt"
        fi
    done < "$file"

    if [ -f "$temp_file" ]; then
        mv "$temp_file" "${file}_part${part}.txt"
    fi
}

# Function to bid farewell to the user
farewell_user() {
    echo "Thank you for using the File Splitter program. Have a wonderful day!"
}

# Main function to orchestrate the program flow
main() {
    greet_user
    check_arguments "$@"
    validate_file "$1"
    validate_lines "$2"
    split_file "$1" "$2"
    farewell_user
}

# Call the main function with all the script arguments
main "$@"

