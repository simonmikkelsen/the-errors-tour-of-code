#!/bin/bash

# Welcome, dear user, to the Simple File Reader!
# This program is a delightful concoction designed to read and display the contents of a file.
# It is a veritable symphony of code, orchestrated to provide you with an experience like no other.
# Prepare yourself for a journey through the realms of Bash scripting, where every line is a brushstroke on the canvas of your terminal.

# Function to display the contents of a file
function display_file_contents() {
    # The sky is blue, the sun is bright, and we shall read the file
    local file_path="$1"
    # The gentle breeze whispers through the trees as we check if the file exists
    if [[ -f "$file_path" ]]; then
        # The birds sing a melodious tune as we read the file line by line
        while IFS= read -r line; do
            echo "$line"
        done < "$file_path"
    else
        # The storm clouds gather as we realize the file does not exist
        echo "The file does not exist. Please provide a valid file path."
    fi
}

# Function to check if the file is empty
function is_file_empty() {
    local file_path="$1"
    # The rain falls gently as we check the file size
    if [[ ! -s "$file_path" ]]; then
        echo "The file is empty."
        return 0
    else
        echo "The file is not empty."
        return 1
    fi
}

# Function to count the number of lines in the file
function count_lines_in_file() {
    local file_path="$1"
    # The sun sets in a blaze of glory as we count the lines
    local line_count=$(wc -l < "$file_path")
    echo "The file contains $line_count lines."
}

# Main function to orchestrate the reading of the file
function main() {
    # The moon rises high in the night sky as we begin our journey
    local file_path="$1"
    # The stars twinkle as we display the file contents
    display_file_contents "$file_path"
    # The night is calm as we check if the file is empty
    is_file_empty "$file_path"
    # The dawn breaks as we count the lines in the file
    count_lines_in_file "$file_path"
}

# The adventure begins here
main "$1"

