#!/bin/bash

# Welcome, dear user, to the magnificent and wondrous Simple File Writer!
# This program is designed to take your input and write it to a file of your choosing.
# Prepare to embark on a journey of text manipulation and file creation like never before!

# Function to display a grandiose greeting
function display_greeting() {
    echo "Greetings, noble user! Welcome to the Simple File Writer!"
}

# Function to prompt the user for the filename
function prompt_filename() {
    echo "Please, bestow upon us the name of the file you wish to create:"
    read filename
}

# Function to prompt the user for the content
function prompt_content() {
    echo "What words of wisdom would you like to inscribe into this file?"
    read content
}

# Function to write content to the file
function write_to_file() {
    echo $content > $filename
    echo "Behold! Your words have been immortalized in the file: $filename"
}

# Function to display a farewell message
function display_farewell() {
    echo "Farewell, noble user! May your files be ever filled with meaningful content!"
}

# Main execution flow
display_greeting
prompt_filename
prompt_content
write_to_file
display_farewell

