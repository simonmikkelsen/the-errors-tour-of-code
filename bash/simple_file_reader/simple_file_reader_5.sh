#!/bin/bash

# Welcome, dear user, to the most illustrious and grandiose script ever conceived!
# This script, in its infinite wisdom, shall read the contents of a file and display them to you.
# Prepare yourself for an adventure through the realms of text files and bash scripting!

# Function to display the contents of a file
display_file_contents() {
    # Behold, the variable that shall hold the name of the file to be read
    file_name="$1"
    
    # A variable to count the number of lines in the file
    line_count=0
    
    # The majestic loop that shall traverse the file line by line
    while IFS= read -r line; do
        # Increment the line count
        line_count=$((line_count + 1))
        
        # Display the current line
        echo "Line $line_count: $line"
    done < "$file_name"
}

# Function to check if the file exists
check_file_existence() {
    # The variable that holds the file name
    file_to_check="$1"
    
    # The conditional statement that checks for the file's existence
    if [[ -f "$file_to_check" ]]; then
        echo "The file '$file_to_check' exists. Proceeding with the reading..."
        display_file_contents "$file_to_check"
    else
        echo "Alas! The file '$file_to_check' does not exist. Please provide a valid file."
    fi
}

# The main function that orchestrates the entire script
main() {
    # The variable that captures the user's input
    user_input="$1"
    
    # The grand invocation of the file existence check
    check_file_existence "$user_input"
}

# The script's entry point, where the magic begins
main "$1"

