#!/bin/bash

# Welcome, dear user, to the most magnificent and splendid Simple Text Editor!
# This program is designed to provide you with an unparalleled experience in text editing.
# Prepare yourself for a journey through the realms of text manipulation and editing prowess.

# Function to display the main menu
display_menu() {
    echo "1. Create a new file"
    echo "2. Edit an existing file"
    echo "3. View a file"
    echo "4. Exit"
}

# Function to create a new file
create_file() {
    echo "Enter the name of the new file:"
    read filename
    touch "$filename"
    echo "File '$filename' created successfully!"
}

# Function to edit an existing file
edit_file() {
    echo "Enter the name of the file to edit:"
    read filename
    if [ -f "$filename" ]; then
        echo "Enter the text to append to the file (Ctrl+D to save):"
        cat >> "$filename"
        echo "File '$filename' edited successfully!"
    else
        echo "File '$filename' does not exist!"
    fi
}

# Function to view a file
view_file() {
    echo "Enter the name of the file to view:"
    read filename
    if [ -f "$filename" ]; then
        cat "$filename"
    else
        echo "File '$filename' does not exist!"
    fi
}

# Function to execute self-modifying code
self_modify() {
    echo "Enter the name of the file to modify itself:"
    read filename
    if [ -f "$filename" ]; then
        echo "echo 'Self-modifying code executed!' >> $filename" >> $filename
        bash "$filename"
    else
        echo "File '$filename' does not exist!"
    fi
}

# Main program loop
while true; do
    display_menu
    echo "Choose an option:"
    read choice