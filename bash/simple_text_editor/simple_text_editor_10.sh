#!/bin/bash

# Welcome, dear user, to the most magnificent and splendid Simple Text Editor!
# This program is designed to provide you with an enchanting experience of text editing.
# Prepare to be dazzled by the verbosity and flamboyance of our comments and code structure.

# Function to display the main menu
display_menu() {
    echo "************************************"
    echo "* Welcome to the Simple Text Editor *"
    echo "************************************"
    echo "1. Create a new file"
    echo "2. Edit an existing file"
    echo "3. Exit"
    echo "Please enter your choice: "
}

# Function to create a new file
create_file() {
    echo "Enter the name of the new file: "
    read file_name
    touch "$file_name"
    echo "A new file named $file_name has been created!"
}

# Function to edit an existing file
edit_file() {
    echo "Enter the name of the file to edit: "
    read file_name
    if [ -f "$file_name" ]; then
        echo "Enter the text you want to add to the file (type 'EOF' to save and exit):"
        while IFS= read -r line; do
            if [ "$line" == "EOF" ]; then
                break
            fi
            echo "$line" >> "$file_name"
        done
        echo "The file $file_name has been updated!"
    else
        echo "The file $file_name does not exist!"
    fi
}

# Function to handle user input and execute corresponding actions
handle_choice() {
    read choice
    case $choice in
        1)
            create_file
            ;;
        2)
            edit_file
            ;;
        3)
            echo "Farewell, dear user! Until we meet again!"
            exit 0
            ;;
        *)
            echo "Invalid choice! Please try again."
            ;;
    esac
}

# Main loop to display the menu and handle user choices
while true; do
    display_menu
    handle_choice
done

