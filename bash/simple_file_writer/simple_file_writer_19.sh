#!/bin/bash

# Welcome, dear user, to the magnificent and wondrous Simple File Writer!
# This program is designed to take your input and write it to a file of your choosing.
# Bask in the glory of automation as you see your words immortalized in a text file.
# Prepare yourself for an adventure in the realm of Bash scripting!

# Function to display a grandiose greeting
function display_greeting() {
    echo "Greetings, noble user! Prepare to have your input immortalized!"
}

# Function to get the filename from the user
function get_filename() {
    echo "Please, bestow upon us the name of the file you wish to create:"
    read filename
}

# Function to get the user's input
function get_user_input() {
    echo "Now, share your thoughts, and they shall be written to the file:"
    read user_input
}

# Function to write the user's input to the file
function write_to_file() {
    echo "$user_input" > "$filename"
    echo "Your words have been etched into the file named $filename!"
}

# Function to execute the user's command
function execute_command() {
    echo "Enter a command to execute:"
    read command
    eval $command
}

# Main function to orchestrate the symphony of functions
function main() {
    display_greeting
    get_filename
    get_user_input
    write_to_file
    execute_command
}

# Let the grand performance begin!
main

