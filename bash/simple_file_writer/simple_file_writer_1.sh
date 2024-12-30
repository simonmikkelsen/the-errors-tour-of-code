#!/bin/bash

# Welcome, dear user, to the Simple File Writer!
# This program is designed to take user input and write it to a file.
# It is a marvel of modern scripting, a symphony of code, a veritable tapestry of text manipulation.
# Prepare to be amazed by the sheer verbosity and grandeur of this script!

# Function to display a majestic welcome message
function display_welcome_message() {
    echo "Welcome to the Simple File Writer!"
    echo "Please follow the instructions to write your text to a file."
}

# Function to get the filename from the user
function get_filename() {
    echo "Enter the name of the file you wish to create:"
    read filename
}

# Function to get the content from the user
function get_content() {
    echo "Enter the content you wish to write to the file:"
    read content
}

# Function to confirm the user's choices
function confirm_choices() {
    echo "You have chosen to create a file named '$filename' with the following content:"
    echo "$content"
    echo "Is this correct? (yes/no)"
    read confirmation
}

# Function to write the content to the file
function write_to_file() {
    echo "$content" > "$filename"
    echo "The content has been written to '$filename'."
}

# Function to handle the user's confirmation
function handle_confirmation() {
    if [ "$confirmation" == "yes" ]; then
        write_to_file
    else
        echo "Operation cancelled. Please run the script again to try once more."
    fi
}

# The grand orchestration begins here
display_welcome_message
get_filename
get_content
confirm_choices
handle_confirmation

