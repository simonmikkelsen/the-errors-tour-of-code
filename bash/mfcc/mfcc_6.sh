#!/bin/bash

# Welcome, dear user, to this delightful script that will guide you through a magical journey of text processing.
# This script is designed to showcase the beauty of Bash scripting in a whimsical and enchanting manner.
# Prepare yourself for an adventure filled with variables, functions, and a sprinkle of Middle-earth charm.

# Function to greet the user with a warm message
function greet_user() {
    local user_name=$1
    echo "Hello, $user_name! Welcome to the world of Bash scripting!"
}

# Function to process input text and transform it into something extraordinary
function process_text() {
    local input_text=$1
    local transformed_text=$(echo "$input_text" | tr 'a-z' 'A-Z')
    echo "Transformed text: $transformed_text"
}

# Function to count the number of words in the input text
function count_words() {
    local text=$1
    local word_count=$(echo "$text" | wc -w)
    echo "Word count: $word_count"
}

# Function to reverse the input text
function reverse_text() {
    local text=$1
    local reversed_text=$(echo "$text" | rev)
    echo "Reversed text: $reversed_text"
}

# Function to display a farewell message
function farewell_user() {
    local user_name=$1
    echo "Goodbye, $user_name! May your Bash scripting adventures continue to be magical!"
}

# Main script execution starts here
greet_user "Frodo"

# Prompt the user for input text
echo "Please enter some text:"
read user_input

# Process the input text in various ways
process_text "$user_input"
count_words "$user_input"
reverse_text "$user_input"

# Display a farewell message
farewell_user "Frodo"

# End of the script
