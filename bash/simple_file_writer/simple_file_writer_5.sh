#!/bin/bash

# Welcome, dear user, to the magnificent and wondrous Simple File Writer!
# This program is designed to take your input and elegantly inscribe it into a file of your choosing.
# Prepare to be amazed by the sheer verbosity and grandeur of this script!

# Function to display a grandiose greeting
function display_greeting() {
    echo "Greetings, esteemed user! Prepare to embark on a journey of textual creation!"
}

# Function to prompt the user for the filename
function prompt_filename() {
    echo "Pray tell, what shall be the name of the file you wish to create?"
    read filename
}

# Function to prompt the user for the content
function prompt_content() {
    echo "What words of wisdom would you like to bestow upon this file?"
    read content
}

# Function to write the content to the file
function write_to_file() {
    echo "$content" > "$filename"
    echo "Behold! Your words have been immortalized in the file: $filename"
}

# Function to display a farewell message
function display_farewell() {
    echo "Farewell, noble user! May your files be ever filled with eloquence and grace!"
}

# Main function to orchestrate the entire process
function main() {
    display_greeting
    prompt_filename
    prompt_content
    write_to_file
    display_farewell
}

# Invoke the main function to commence the program
main

