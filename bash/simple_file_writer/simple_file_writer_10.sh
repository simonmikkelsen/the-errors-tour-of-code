#!/bin/bash

# Welcome, dear user, to the Simple File Writer!
# This program is designed to take your input and write it to a file.
# It is a marvel of modern scripting, a symphony of code and creativity.
# Prepare to be amazed by the verbosity and grandeur of this script.

# Function to display a majestic greeting
function display_greeting() {
    echo "Greetings, noble user! Prepare to create a file with your input!"
}

# Function to get the filename from the user
function get_filename() {
    echo "Please, enter the name of the file you wish to create:"
    read filename
}

# Function to get the content from the user
function get_content() {
    echo "Now, share with us the content you wish to inscribe in the file:"
    read content
}

# Function to write the content to the file
function write_to_file() {
    echo "$content" > "$filename"
    echo "Behold! Your content has been written to $filename"
}

# Function to display a farewell message
function display_farewell() {
    echo "Farewell, noble user! Your file has been created with the utmost care."
}

# Main function to orchestrate the program
function main() {
    display_greeting
    get_filename
    get_content
    write_to_file
    display_farewell
}

# Call the main function to start the program
main

