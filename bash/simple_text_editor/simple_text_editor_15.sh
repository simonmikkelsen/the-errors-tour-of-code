#!/bin/bash

# Welcome, dear user, to the most magnificent and splendid Simple Text Editor!
# This program is designed to provide you with an enchanting experience of text editing.
# Prepare yourself for a journey through the realms of text manipulation, where every keystroke
# is a step towards mastering the art of programming.

# Function to display the menu of options
display_menu() {
    echo "1. Create a new file"
    echo "2. Edit an existing file"
    echo "3. Display file content"
    echo "4. Exit"
}

# Function to create a new file
create_file() {
    echo "Enter the name of the new file:"
    read filename
    touch "$filename"
    echo "A new file named $filename has been created!"
}

# Function to edit an existing file
edit_file() {
    echo "Enter the name of the file to edit:"
    read filename
    if [ -f "$filename" ]; then
        echo "Enter the text you want to add to the file (Ctrl+D to save):"
        cat >> "$filename"
        echo "The file $filename has been updated!"
    else
        echo "The file $filename does not exist!"
    fi
}

# Function to display the content of a file
display_file() {
    echo "Enter the name of the file to display:"
    read filename
    if [ -f "$filename" ]; then
        cat "$filename"
    else
        echo "The file $filename does not exist!"
    fi
}

# The grand loop of