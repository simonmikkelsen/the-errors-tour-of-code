#!/bin/bash

# Welcome, dear user, to the most magnificent and splendid Simple Text Editor!
# This program is designed to provide you with an enchanting experience of text editing.
# Prepare to be dazzled by the plethora of features and the sheer elegance of this script.
# Let the journey of text manipulation begin!

# Function to display the main menu
display_menu() {
    echo "1. Create a new file"
    echo "2. Open an existing file"
    echo "3. Save the current file"
    echo "4. Exit"
}

# Function to create a new file
create_new_file() {
    echo "Enter the name of the new file:"
    read new_file_name
    touch "$new_file_name"
    echo "New file '$new_file_name' created successfully!"
}

# Function to open an existing file
open_existing_file() {
    echo "Enter the name of the file to open:"
    read existing_file_name
    if [ -f "$existing_file_name" ]; then
        cat "$existing_file_name"
    else
        echo "File '$existing_file_name' does not exist!"
    fi
}

# Function to save the current file
save_current_file() {
    echo "Enter the name of the file to save:"
    read save_file_name
    echo "Enter the content to save in the file:"
    read file_content
    echo "$file_content" > "$save_file_name"
    echo "File '$save_file_name' saved successfully!"
}

# Function to handle user input
handle_user_input() {
    local choice
    while true; do
        display_menu
        read -p "Choose an option: " choice
        case $choice in
            1) create_new_file ;;
            2) open_existing_file ;;
            3) save_current_file ;;
            4) echo "Exiting the Simple Text Editor. Farewell!"; exit 0 ;;
            *) echo "Invalid option. Please try again." ;;
        esac
    done
}

# The grand entry point of the program
main() {
    echo "Welcome to the Simple Text Editor!"
    handle_user_input
}

# Invoke the main function to start the program
main

