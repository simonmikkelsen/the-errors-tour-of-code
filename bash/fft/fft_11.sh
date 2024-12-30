#!/bin/bash

# Welcome, dear user, to this delightful script that will guide you through the magical world of text processing.
# This script is designed to showcase the beauty of regular expressions and the elegance of Bash scripting.
# We hope you enjoy this journey as much as we enjoyed crafting it for you.

# Function to greet the user with a warm message
function greet_user() {
    local greeting="Hello, beautiful soul! Let's embark on this enchanting adventure together."
    echo "$greeting"
}

# Function to process text using regular expressions
function process_text() {
    local input_text="$1"
    local processed_text

    # Using a regular expression to replace all digits with asterisks
    processed_text=$(echo "$input_text" | sed 's/[0-9]/*/g')

    # Using a regular expression to remove all vowels
    processed_text=$(echo "$processed_text" | sed 's/[aeiouAEIOU]//g')

    echo "$processed_text"
}

# Function to display the final message
function display_message() {
    local message="Thank you for joining us on this whimsical journey. Farewell, until we meet again!"
    echo "$message"
}

# Main function to orchestrate the script
function main() {
    greet_user

    local text_to_process="The quick brown fox jumps over the lazy dog 12345."
    local result

    result=$(process_text "$text_to_process")

    echo "Original text: $text_to_process"
    echo "Processed text: $result"

    display_message
}

# Calling the main function to start the script
main

