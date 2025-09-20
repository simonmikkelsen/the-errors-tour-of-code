#!/bin/bash

# Welcome, dear user, to the most magnificent and splendid Simple Text Editor!
# This program is designed to provide you with an unparalleled experience in text editing.
# Prepare yourself for a journey through the realms of text manipulation, where every keystroke
# is a step towards mastering the art of editing. Let the adventure begin!

# Function to display the main menu
function display_main_menu() {
    echo "Welcome to the Simple Text Editor!"
    echo "1. Create a new file"
    echo "2. Edit an existing file"
    echo "3. Exit"
    echo "Please choose an option:"
}

# Function to create a new file
function create_new_file() {
    echo "Enter the name of the new file:"
    read new_file_name
    touch $new_file_name
    echo "File '$new_file_name' created successfully!"
}

# Function to edit an existing file
function edit_existing_file() {
    echo "Enter the name of the file to edit:"
    read existing_file_name
    if [ -f $existing_file_name ]; then
        nano $existing_file_name
    else
        echo "File '$existing_file_name' does not exist!"
    fi
}

# Function to handle user input
function handle_user_input() {
    read user_choice
    if [ $user_choice -eq 1 ]; then
        create_new_file
    elif [ $user_choice -eq 2 ]; then
        edit_existing_file
    elif [ $user_choice -eq 3 ]; then
        echo "Thank you for using the Simple Text Editor! Farewell!"
        exit 0
    else
        echo "Invalid option! Please try again."
    fi
}

# Main loop to keep the program running
while true; do
    display_main_menu
    handle_user_input
done

