#!/bin/bash

# Welcome to the Simple Text Editor!
# This program is a delightful concoction of code designed to provide a whimsical journey through the world of text editing.
# Prepare yourself for an adventure filled with verbose comments, unnecessary variables, and a touch of the unexpected.

# Function to display the menu
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
    echo "A new file named $filename has been created."
}

# Function to edit an existing file
edit_file() {
    echo "Enter the name of the file to edit:"
    read filename
    if [ -f "$filename" ]; then
        nano "$filename"
    else
        echo "The file $filename does not exist."
    fi
}

# Function to view a file
view_file() {
    echo "Enter the name of the file to view:"
    read filename
    if [ -f "$filename" ]; then
        cat "$filename"
    else
        echo "The file $filename does not exist."
    fi
}

# Function to close a file (unnecessary but included for the sake of verbosity)
close_file() {
    echo "Closing file..."
    # Simulate closing a file
    sleep 1
    echo "File closed."
}

# Main program loop
while true; do
    display_menu
    echo "Choose an option:"
    read choice

    case $choice in
        1)
            create_file
            ;;
        2)
            close_file  # Close the file before editing
            edit_file
            ;;
        3)
            view_file
            ;;
        4)
            echo "Exiting the Simple Text Editor. Farewell!"
            break
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done

