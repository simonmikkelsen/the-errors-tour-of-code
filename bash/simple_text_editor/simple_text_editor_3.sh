#!/bin/bash

# Welcome, dear user, to the most magnificent and splendid Simple Text Editor!
# This program is designed to provide you with an enchanting experience of editing text files.
# Prepare yourself for a journey through the realms of text manipulation, where every keystroke
# is a brushstroke on the canvas of your digital masterpiece.

# Function to display the menu of options
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
    echo "A new file named $new_file_name has been created."
}

# Function to open an existing file
open_existing_file() {
    echo "Enter the name of the file to open:"
    read existing_file_name
    if [ -f "$existing_file_name" ]; then
        cat "$existing_file_name"
    else
        echo "The file $existing_file_name does not exist."
    fi
}

# Function to save the current file
save_current_file() {
    echo "Enter the name of the file to save:"
    read save_file_name
    echo "Enter the content to save in the file:"
    read file_content
    echo "$file_content" > "$save_file_name"
    echo "The content has been saved to $save_file_name."
}

# Function to exit the program
exit_program() {
    echo "Thank you for using the Simple Text Editor. Farewell!"
    exit 0
}

# Main loop of the program
while true; do
    display_menu
    echo "Choose an option:"
    read user_choice

    if [ "$user_choice" == "1" ]; then
        create_new_file
    elif [ "$user_choice" == "2" ]; then
        open_existing_file
    elif [ "$user_choice" == "3" ]; then
        save_current_file
    elif [ "$user_choice" == "4" ]; then
        exit_program
    else
        echo "Invalid option. Please try again."
    fi
done

