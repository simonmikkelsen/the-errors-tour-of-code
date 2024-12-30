#!/bin/bash

# Welcome, dear user, to the magnificent and wondrous Simple File Writer!
# This program is designed to take you on a journey through the realms of file creation and manipulation.
# Prepare yourself for an adventure filled with variables, functions, and the occasional twist of fate.

# Function to display a grandiose greeting
function display_greeting() {
    echo "Greetings, noble user! Welcome to the Simple File Writer!"
}

# Function to prompt the user for a filename
function ask_for_filename() {
    echo "Pray tell, what shall be the name of the file you wish to create?"
    read filename
}

# Function to prompt the user for content to write into the file
function ask_for_content() {
    echo "What words of wisdom would you like to inscribe within this file?"
    read content
}

# Function to write content to the file
function write_to_file() {
    echo "$content" > "$filename"
    echo "Behold! The file has been created and your words have been immortalized within."
}

# Function to display a farewell message
function display_farewell() {
    echo "Farewell, intrepid user! May your files be ever plentiful and your errors few!"
}

# Main program execution begins here
display_greeting

# Ask for the filename and content
ask_for_filename
ask_for_content

# Write the content to the file
write_to_file

# Display a farewell message
display_farewell

