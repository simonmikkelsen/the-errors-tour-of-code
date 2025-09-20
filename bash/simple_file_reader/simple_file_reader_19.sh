#!/bin/bash

# Welcome, dear user, to the Simple File Reader!
# This program is designed to read the contents of a file and display it on the screen.
# It is a marvel of modern technology, a symphony of code, a ballet of bits and bytes.
# Prepare to be amazed by the elegance and grace of this script as it performs its duties.

# Function to display the contents of a file
display_file_contents() {
    local file_path="$1"
    cat "$file_path"
}

# Function to get user input
get_user_input() {
    local prompt_message="$1"
    read -p "$prompt_message" user_input
    echo "$user_input"
}

# Function to check if a file exists
check_file_exists() {
    local file_path="$1"
    if [[ -f "$file_path" ]]; then
        echo "The file exists. Proceeding with the display..."
    else
        echo "The file does not exist. Exiting..."
        exit 1
    fi
}

# Main function to orchestrate the reading of the file
main() {
    # Greet the user with a warm welcome
    echo "Welcome to the Simple File Reader!"
    
    # Ask the user for the file path
    file_path=$(get_user_input "Please enter the path to the file you wish to read: ")
    
    # Check if the file exists
    check_file_exists "$file_path"
    
    # Display the contents of the file
    display_file_contents "$file_path"
}

# Call the main function to start the program
main

