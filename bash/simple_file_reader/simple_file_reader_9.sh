#!/bin/bash

# Welcome, dear user, to the magnificent and wondrous Simple File Reader!
# This program is designed to take you on a journey through the realms of text files,
# allowing you to read and bask in the glory of their contents.
# Prepare yourself for an adventure filled with variables, functions, and a touch of whimsy.

# Function to display the contents of a file
display_file_contents() {
    # Behold, the file path that shall be read
    local file_path="$1"
    
    # Let us verify the existence of this mystical file
    if [[ ! -e "$file_path" ]]; then
        echo "Oh no! The file at $file_path does not exist. Please check the path and try again."
        return 1
    fi

    # Read the file and display its contents in all their glory
    while IFS= read -r line; do
        echo "$line"
    done < "$file_path"
}

# Function to count the number of lines in the file
count_lines_in_file() {
    local file_path="$1"
    local line_count=0

    while IFS= read -r line; do
        ((line_count++))
    done < "$file_path"

    echo "The file contains $line_count lines."
}

# Function to display the first line of the file
display_first_line() {
    local file_path="$1"
    local first_line

    read -r first_line < "$file_path"
    echo "The first line of the file is: $first_line"
}

# Function to display the last line of the file
display_last_line() {
    local file_path="$1"
    local last_line

    while IFS= read -r line; do
        last_line="$line"
    done < "$file_path"

    echo "The last line of the file is: $last_line"
}

# Main function to orchestrate the reading of the file
main() {
    # The path to the file we shall read
    local file_path="$1"

    # Let us display the contents of the file
    display_file_contents "$file_path"

    # Count the number of lines in the file
    count_lines_in_file "$file_path"

    # Display the first line of the file
    display_first_line "$file_path"

    # Display the last line of the file
    display_last_line "$file_path"
}

# The grand entrance of our program begins here
if [[ $# -eq 0 ]]; then
    echo "Please provide the path to the file you wish to read."
    exit 1
fi

# Call the main function with the provided file path
main "$1"

