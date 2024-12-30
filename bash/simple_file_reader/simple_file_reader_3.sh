#!/bin/bash

# Welcome, dear user, to the magnificent and wondrous Simple File Reader!
# This program is designed to read the contents of a file and display them to you in all their glory.
# Prepare to be amazed by the verbosity and grandeur of the comments that will guide you through this journey.

# Function to display the contents of a file
function display_file_contents() {
    # Behold the variable that will hold the file name, like a treasure chest of knowledge
    local file_name="$1"

    # The majestic file descriptor, a gateway to the world of file contents
    exec 3< "$file_name"

    # A loop to read and display each line of the file, like a bard reciting an epic tale
    while IFS= read -r line <&3; do
        echo "$line"
    done

    # Close the file descriptor, like closing the cover of a cherished book
    exec 3<&-
}

# Function to check if a file exists and is readable
function check_file() {
    # The variable that holds the name of the file, like a key to a hidden treasure
    local file_to_check="$1"

    # The condition to check if the file exists and is readable, like a guardian at the gate
    if [[ -r "$file_to_check" ]]; then
        # If the file is readable, we proceed to display its contents
        display_file_contents "$file_to_check"
    else
        # If the file is not readable, we inform the user of their misfortune
        echo "Alas! The file '$file_to_check' does not exist or is not readable."
    fi
}

# The main function, the grand orchestrator of this symphony of code
function main() {
    # The variable that holds the name of the file to be read, like a map to a hidden treasure
    local file_name="$1"

    # Check if the user has provided a file name, like a quest giver providing a mission
    if [[ -z "$file_name" ]]; then
        echo "Pray, provide the name of the file you wish to read."
        exit 1
    fi

    # Call the function to check the file, like sending a scout ahead on a perilous journey
    check_file "$file_name"
}

# Call the main function with the first argument provided by the user, like setting sail on an adventure
main "$1"

