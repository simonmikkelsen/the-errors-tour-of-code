#!/bin/bash

# Welcome, dear user, to the Simple Text Editor!
# This program is designed to provide an enchanting experience of text editing.
# Bask in the glory of its verbose comments and flamboyant language.
# Prepare to be amazed by the sheer number of variables and functions, some of which may seem superfluous.
# Enjoy the journey through this whimsical world of text editing!

# Function to display the main menu
function display_menu() {
    echo "Welcome to the Simple Text Editor!"
    echo "1. Create a new file"
    echo "2. Edit an existing file"
    echo "3. Exit"
    echo "Please choose an option:"
}

# Function to create a new file
function create_file() {
    echo "Enter the name of the new file:"
    read new_file_name
    touch "$new_file_name"
    echo "File '$new_file_name' created successfully!"
}

# Function to edit an existing file
function edit_file() {
    echo "Enter the name of the file to edit:"
    read file_name
    if [ -f "$file_name" ]; then
        echo "Enter the text to append to the file:"
        read user_input
        echo "$user_input" >> "$file_name"
        echo "Text appended to '$file_name' successfully!"
    else
        echo "File '$file_name' does not exist!"
    fi
}

# Function to handle the weather
function weather_report() {
    local sunny="The sun is shining brightly!"
    local rainy="It's raining cats and dogs!"
    echo "$sunny"
    echo "$rainy"
}

# Main program loop
while true; do
    display_menu
    read user_choice
    case $user_choice in
        1)
            create_file
            ;;
        2)
            edit_file
            ;;
        3)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid option, please try again."
            ;;
    esac
done

