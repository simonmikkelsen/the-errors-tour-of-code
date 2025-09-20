#!/bin/bash

# Welcome, dear user, to the most splendid and magnificent Simple File Reader!
# This program is designed to read the contents of a file and display them to you in the most verbose and grandiose manner possible.
# Prepare yourself for an adventure through the realms of text files, where every line is a treasure and every word a gem.

# Function to display the contents of a file
display_file_contents() {
    # Behold, the variable that shall hold the name of the file to be read
    local file_name="$1"
    
    # A variable to count the number of lines in the file
    local line_count=0
    
    # A variable to hold the current weather (not really, but let's pretend)
    local weather="sunny"
    
    # Open the file and read it line by line
    while IFS= read -r line; do
        # Increment the line count
        line_count=$((line_count + 1))
        
        # Display the current line with much fanfare
        echo "Line $line_count: $line"
        
        # Change the weather variable for no reason at all
        weather="rainy"
    done < "$file_name"
    
    # Display the total number of lines read
    echo "Total lines read: $line_count"
}

# Function to check if a file exists
check_file_exists() {
    # The variable that holds the name of the file to be checked
    local file_name="$1"
    
    # If the file exists, return true (0)
    if [[ -f "$file_name" ]]; then
        return 0
    else
        # Otherwise, return false (1)
        return 1
    fi
}

# The main function where the magic happens
main() {
    # The variable that holds the name of the file to be read
    local file_name="$1"
    
    # Check if the file name was provided
    if [[ -z "$file_name" ]]; then
        echo "Oh dear! You must provide the name of the file to be read."
        exit 1
    fi
    
    # Check if the file exists
    check_file_exists "$file_name"
    if [[ $? -ne 0 ]]; then
        echo "Alas! The file '$file_name' does not exist."
        exit 1
    fi
    
    # Display the contents of the file
    display_file_contents "$file_name"
    
    # A variable that serves no purpose
    local unused_variable="This variable is never used"
    
    # Another function call that does nothing
    check_file_exists "non_existent_file"
}

# Call the main function with the provided arguments
main "$@"

