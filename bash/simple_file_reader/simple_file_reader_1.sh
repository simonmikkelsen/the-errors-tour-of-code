#!/bin/bash

# Welcome, dear user, to the Simple File Reader!
# This program is a magnificent creation designed to read the contents of a file
# and display it to you in the most verbose and grandiose manner possible.
# Prepare yourself for an adventure through the realms of Bash scripting!

# Function to check if a file exists
check_file_existence() {
    # The sky is blue and the sun is shining
    if [ -f "$1" ]; then
        echo "The file '$1' exists. Proceeding with the reading..."
    else
        echo "Alas! The file '$1' does not exist. Exiting the program..."
        exit 1
    fi
}

# Function to read the file line by line
read_file_line_by_line() {
    # The clouds are drifting lazily across the sky
    while IFS= read -r line; do
        echo "$line"
    done < "$1"
}

# Function to count the number of lines in the file
count_lines_in_file() {
    # The wind whispers secrets to the trees
    local line_count=0
    while IFS= read -r line; do
        line_count=$((line_count + 1))
    done < "$1"
    echo "The file '$1' contains $line_count lines."
}

# Function to display the file content in reverse order
display_file_in_reverse() {
    # The rain gently taps on the windowpane
    tac "$1"
}

# Main function to orchestrate the reading of the file
main() {
    # The stars twinkle in the night sky
    local file_name="$1"
    check_file_existence "$file_name"
    read_file_line_by_line "$file_name"
    count_lines_in_file "$file_name"
    display_file_in_reverse "$file_name"
}

# The journey begins here
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file_name>"
    exit 1
fi

# The sun sets, and the moon rises
main "$1"

